class Api::V1::Private::ReferralMethodsController < ApplicationController
  before_action :set_referral_method, only: [:show, :update, :destroy]

  # GET /api/v1/private/referral_methods
  def index
    @referral_methods = ReferralMethod.all

    render json: @referral_methods
  end

  # GET /api/v1/private/referral_methods/1
  def show
    render json: @referral_method
  end

  # POST /api/v1/private/referral_methods
  def create
    @referral_method = ReferralMethod.new(referral_method_params)

    if @referral_method.save
      render json: @referral_method, status: :created, location: api_v1_private_referral_method_path(@referral_method)
    else
      render json: @referral_method.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/private/referral_methods/1
  def update
    if @referral_method.update(referral_method_params)
      render json: @referral_method
    else
      render json: @referral_method.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/private/referral_methods/1
  def destroy
    @referral_method.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referral_method
      @referral_method = ReferralMethod.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def referral_method_params
      params.require(:referral_method).permit(:name)
    end
end
