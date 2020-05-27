class Api::V1::Private::MemberServicesController < ApplicationController
  include Secured
  before_action :set_member_service, only: [:show, :update, :destroy]

  # GET api/v1/private/member_services
  def index
    @member_services = MemberService.all

    render json: @member_services
  end

  # GET api/v1/private/member_services/1
  def show
    render json: @member_service
  end

  # POST api/v1/private/member_services
  def create
    @member_service = MemberService.new(member_service_params)

    if @member_service.save
      render json: @member_service, status: :created, location: api_v1_private_member_service_path(@member_service)
    else
      render json: @member_service.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT api/v1/private/member_services/1
  def update
    if @member_service.update(member_service_params)
      p member_service_params
      render json: @member_service
    else
      render json: @member_service.errors, status: :unprocessable_entity
    end
  end

  # DELETE api/v1/private/member_services/1
  def destroy
    @member_service.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member_service
      @member_service = MemberService.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def member_service_params
      params.require(:member_service).permit(:name, :contact_name, :description, :image, :website_url, :facebook_url, :twitter_url, :instagram_url, :email, :phone, :active)
    end
end
