class Api::V1::Public::TeamsController < ApplicationController
  before_action :set_team, only: [:full]

  # GET api/v1/public/teams/active
  def active
    @teams = Team.where(active: true)

    render json: @teams, include: ['teams']
  end

  # GET api/v1/public/teams/1/full
  def full
    render json: @team, include: ['team', 'convenor', 'members']
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = Team.find(params[:id])
  end

end
