class Api::V1::Public::ReferralMethodsController < ApplicationController

  # GET /api/v1/public/referral_methods
  def index
    @referral_methods = ReferralMethod.all

    render json: @referral_methods
  end

end
