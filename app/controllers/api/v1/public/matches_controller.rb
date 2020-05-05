class Api::V1::Public::MatchesController < ApplicationController
  before_action :set_match, only: [:full]

  # GET api/v1/public/matches/for_team
  def for_team
    team_id = params[:team_id]
    @matches = Match.for_team(team_id)

    render json: @matches, include: ['home_team', 'away_team', 'field', 'status']
  end

  # GET api/v1/public/matches/1/full
  def full
    render json: @match, include: ['home_team', 'away_team', 'field', 'status']
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_match
    @match = Match.find(params[:id])
  end

end
