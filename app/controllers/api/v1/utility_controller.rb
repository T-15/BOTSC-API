class Api::V1::UtilityController < ApplicationController

    # GET /api/v1/utility/season_menu
    def season_menu
        season = Season.find_by(active: true)

        render json: season,
        include: 'divisions.teams'
    end

    # GET /api/v1/utility/application
    def application
        status = Status.get_applicant.first

        Member.transaction do
            @member = Member.create(
                status: status,
                first_name: params[:first_name],
                last_name: params[:last_name],
                phone: params[:phone],
                email: params[:email],
                birthday: params[:birthday],
                postal_code: params[:postal_code],
                member_since: 0,
                referral_method: ReferralMethod.find(params[:referral_method])
            )

            desired_division = Division.find(params[:division])

            Note.create(member: @member, content: "Application - Self Grade: " + params[:grade])
            Note.create(member: @member, content: "Application - Desired Division: " + desired_division.name)

            if params.has_key?(:referrer)
                Note.create(member: @member, content: "Application - Referrer: " + params[:referrer])
            end

            if params.has_key?(:additional_info)
                Note.create(member: @member, content: "Application - Additional Information: " + params[:additional_info])
            end

            if params[:forward] == true
                MemberPosition.create(member: @member, position: Position.find_by(name: "forward"))
            end

            if params[:midfield] == true
                MemberPosition.create(member: @member, position: Position.find_by(name: "midfield"))
            end

            if params[:defence] == true
                MemberPosition.create(member: @member, position: Position.find_by(name: "defence"))
            end

            if params[:goalkeeper] == true
                MemberPosition.create(member: @member, position: Position.find_by(name: "goalkeeper"))
            end
        end

        if @member.save
            render json: "Success".to_json, status: :created
          else
            render json: @member.errors, status: :unprocessable_entity
          end
    end
end
