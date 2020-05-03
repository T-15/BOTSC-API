class Api::V1::UtilityController < ApplicationController

    # GET /api/v1/utility/season_menu
    def season_menu
        season = Season.find_by(active: true)

        render json: season,
        include: 'divisions.teams'
    end

    # GET /api/v1/utility/application
    def application
        errors = []
        data = params[:data]
        status = Status.get_applicant.first

        begin
            referralMethod = ReferralMethod.find(data[:referralMethod])
        rescue ActiveRecord::RecordNotFound => exception
            render json: {status: "error", code: 404, message: "Please let us know how you heard about us"}, status: :unprocessable_entity
            return
        end

        begin
            desired_division = Division.find(data[:division])
        rescue ActiveRecord::RecordNotFound => exception
            render json: {status: "error", code: 404, message: "Please choose a division you wish to play in"}, status: :unprocessable_entity
            return
        end

        if !data.key?(:firstName) || data[:firstName].empty?
            errors.push({missing_param: "First Name"})
        end

        if !data.key?(:lastName) || data[:lastName].empty?
            errors.push({missing_param: "Last Name"})
        end

        if !data.key?(:email) || data[:email].empty?
            errors.push({missing_param: "Email"})
        end

        if !data.key?(:postalCode) || data[:postalCode].empty?
            errors.push({missing_param: "Postal Code"})
        end

        if !data.key?(:phone) || data[:phone].empty?
            errors.push({missing_param: "Phone"})
        end

        if !data.key?(:birthday) || data[:birthday].empty?
            errors.push({missing_param: "Birthday"})
        end

        if !data.key?(:grade) || data[:grade].empty?
            errors.push({missing_param: "Skill Level"})
        end

        if !data.key?(:division) || data[:division].empty?
            errors.push({missing_param: "Division"})
        end

        if !data.key?(:referralMethod) || data[:referralMethod].empty?
            errors.push({missing_param: "Referral Method"})
        end

        if errors.any?
            render json: errors.to_json, status: :unprocessable_entity
            return
        end

        begin
            ActiveRecord::Base.transaction do
                @member = Member.create(
                    status: status,
                    first_name: data[:firstName],
                    last_name: data[:lastName],
                    phone: data[:phone],
                    email: data[:email],
                    birthday: data[:birthday],
                    postal_code: data[:postalCode],
                    member_since: 0,
                    referral_method: referralMethod
                )

                Note.create(member: @member, content: "Application - Self Grade: " + data[:grade])

                waiting_list = WaitingList.find_by(division: desired_division)

                WaitingListMember.create(member: @member, waiting_list: waiting_list)

                if data.key?(:referrer)
                    Note.create(member: @member, content: "Application - Referrer: " + data[:referrer])
                end

                if data.key?(:additional_info)
                    Note.create(member: @member, content: "Application - Additional Information: " + data[:additionalInfo])
                end

                data[:positions].each do |v|
                    MemberPosition.create(member: @member, position_id: v)
                end
            end
        rescue ActiveRecord::RecordInvalid => exception
            render json: exception.message.to_json, status: :unprocessable_entity
        rescue ActiveRecord::RecordNotFound => exception
            render json: exception.message.to_json, status: :unprocessable_entity
        else
            render json: "Success".to_json, status: :created
        end
    end

    def schedule_generator
        # Invoke the Utility service
        service = UtilityService.new
        errors = []
        required_params = ["season_id", "start_date", "end_date", "day_of_matches"]
        errors = service.required_param(params, required_params)

        if errors.any?
            render json: errors.to_json, status: :unprocessable_entity
            return
        end

        # Get season the generator should run for
        season = Season.find(params[:season_id])

        unless season.schedule_generated 
            # Loop through active divisions and add the active teams to an array. A new inner array for each division
            season.divisions.each do |division|
                if division.active
                    division_teams = []

                    division.teams.each do |team|
                        if team.active
                            division_teams.push(team.id)
                        end
                    end

                    # Run the Seed generator
                    seeds = service.seed(division_teams)

                    # Run the Match Day Generator
                    start_date = Date.parse(params[:start_date])
                    end_date = Date.parse(params[:end_date])
                    day_of_matches = [params[:day_of_matches].to_i]
                    exception_dates = []
                    if params.key?(:exception_dates) && !params[:exception_dates].empty?
                        params[:exception_dates].each do |k, date|
                            exception_dates << Date.parse(date)
                        end
                    end

                    match_days = service.get_schedule_dates(start_date, end_date, day_of_matches, exception_dates)

                    # Run the Match creator
                    matches = service.match_creator(seeds, match_days)
                end
            end

            # Mark the season with the generated flag so it can't be done again
            season.schedule_generated = true
            season.save

            render json: "Success".to_json, status: :created
        else
            render json: "Season already has a schedule".to_json, status: :unprocessable_entity
        end
    end
end
