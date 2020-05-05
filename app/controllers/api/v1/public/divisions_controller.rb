class Api::V1::Public::DivisionsController < ApplicationController
  before_action :set_division, only: [:with_teams, :with_teams_full]

  # GET api/v1/public/divisions/active
  def active
    @divisions = Division.where(active: true)

    render json: @divisions, include: ['divisions']
  end

  # GET api/v1/public/divisions/1/with_teams
  def with_teams
    render json: @division, include: ['teams']
  end

  # GET api/v1/public/divisions/1/with_teams_full
  def with_teams_full
    render json: @division, include: ['teams', 'teams.sponsor', 'teams.convenor']
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_division
    @division = Division.find(params[:id])
  end

end
