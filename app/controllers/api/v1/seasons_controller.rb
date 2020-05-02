class Api::V1::SeasonsController < ApplicationController
  before_action :set_season, only: [:show, :update, :destroy]

  # GET api/v1/seasons
  def index
    @seasons = Season.all

    render json: @seasons, include: ['seasons']
  end

  # GET api/v1/seasons/active
  def active
    @season = Season.find_by(active: true)

    render json: @season, include: ['seasons']
  end

  # GET api/v1/seasons/active_with_divisions
  def active_with_divisions
    @season = Season.find_by(active: true)

    render json: @season, include: ['seasons', 'divisions']
  end

  # GET api/v1/seasons/active_with_divisions_teams
  def active_with_divisions_teams
    @season = Season.find_by(active: true)

    render json: @season, include: ['seasons', 'divisions', 'divisions.teams', 'divisions.teams.convenor']
  end

  # GET api/v1/seasons/1
  def show
    render json: @season, include: ['season']
  end

  # POST api/v1/seasons
  def create
    @season = Season.new(season_params)

    if @season.save
      render json: @season, status: :created, location: api_v1_season_path(@season), include: ['season']
    else
      render json: @season.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT api/v1/seasons/1
  def update
    if @season.update(season_params)
      render json: @season, include: ['season']
    else
      render json: @season.errors, status: :unprocessable_entity
    end
  end

  # DELETE api/v1/seasons/1
  def destroy
    @season.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_season
      @season = Season.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def season_params
      params.require(:season).permit(:year, :name, :active)
    end
end
