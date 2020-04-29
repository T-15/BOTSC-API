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
end
