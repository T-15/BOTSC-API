class Api::V1::Private::TeamsController < ApplicationController
  include Secured
  before_action :set_team, only: [:show, :update, :destroy]

  # GET api/v1/private/teams
  def index
    @teams = Team.all

    render json: @teams, include: ['teams']
  end

  # GET api/v1/private/teams/1
  def show
    render json: @team, include: ['team', 'convenor']
  end

  # POST api/v1/private/teams
  def create
    @team = Team.new(team_params)

    if @team.save
      render json: @team, status: :created, location: api_v1_private_team_path(@team), include: ['team']
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT api/v1/private/teams/1
  def update
    if @team.update(team_params)
      render json: @team, include: ['team']
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # DELETE api/v1/private/teams/1
  def destroy
    @team.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def team_params
      params.require(:team).permit(:division_id, :sponsor_id, :convenor_id, :name, :jersey_image, :team_image, :draft_position, :active)
    end
end
