class Api::V1::Private::TeamMembersController < ApplicationController
  include Secured
  before_action :set_team_member, only: [:show, :update, :destroy]

  # GET /api/v1/private/team_members
  def index
    @team_members = TeamMember.all

    render json: @team_members, include: ['team_members']
  end

  # GET /api/v1/private/team_members/1
  def show
    render json: @team_member, include: ['team_member']
  end

  # POST /api/v1/private/team_members
  def create
    @team_member = TeamMember.new(team_member_params)

    if @team_member.save
      render json: @team_member, status: :created, location: api_v1_private_team_member_path(@team_member), include: ['team_member']
    else
      render json: @team_member.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/private/team_members/1
  def update
    if @team_member.update(team_member_params)
      render json: @team_member, include: ['team_member']
    else
      render json: @team_member.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/private/team_members/1
  def destroy
    @team_member.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_member
      @team_member = TeamMember.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def team_member_params
      params.require(:team_member).permit(:member_id, :team_id)
    end
end
