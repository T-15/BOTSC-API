class Api::V1::Private::MatchesController < ApplicationController
  include Secured
  before_action :set_match, only: [:show, :update, :destroy]

  # GET api/v1/private/matches
  def index
    @matches = Match.all

    render json: @matches, include: ['matches']
  end

  # GET api/v1/private/matches/1
  def show
    render json: @match, include: ['match']
  end

  # POST api/v1/private/matches
  def create
    @match = Match.new(match_params)

    if @match.save
      render json: @match, status: :created, location: api_v1_private_match_path(@match), include: ['matches']
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT api/v1/private/matches/1
  def update
    if @match.update(match_params)
      render json: @match, include: ['matches']
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  # DELETE api/v1/private/matches/1
  def destroy
    @match.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def match_params
      params.require(:match).permit(:home_team_id, :away_team_id, :field_id, :status_id, :number, :date, :time, :home_score, :away_score, :additional_information)
    end
end
