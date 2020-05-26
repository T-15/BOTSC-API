class Api::V1::Private::MembersController < ApplicationController
  include Secured
  before_action :set_member, only: [:show, :update, :destroy]

  # GET api/v1/private/members
  def index
    @members = Member.all

    render json: @members, include: ['members']
  end

  # GET api/v1/private/members/active
  def active
    @members = Member.where(active: true)

    render json: @members, include: ['members']
  end

  # GET api/v1/private/members/1
  def show
    render json: @member, include: ['member']
  end

  # POST api/v1/private/members
  def create
    @member = Member.new(member_params)

    if @member.save
      render json: @member, status: :created, location: api_v1_private_member_path(@member), include: ['member']
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT api/v1/private/members/1
  def update
    if @member.update(member_params)
      render json: @member, include: ['member']
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  # DELETE api/v1/private/members/1
  def destroy
    @member.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def member_params
      params.require(:member).permit(
        :shirt_size_id, :short_size_id, :status_id, :first_name, :last_name,
        :birthday, :phone, :email, :postal_code, :image, :member_since, :deceased,
        :deceased_date, :masters_eligible, :active)
    end
end
