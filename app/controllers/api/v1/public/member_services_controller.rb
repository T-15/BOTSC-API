class Api::V1::Public::MemberServicesController < ApplicationController

  # GET api/v1/public/member_services/active
  def active
    @member_services = MemberService.where(active: true)

    render json: @member_services
  end

end
