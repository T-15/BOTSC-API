class Api::V1::Private::SeasonsController < ApplicationController
  before_action :set_season, only: [:show, :update, :destroy]

  # GET api/v1/private/seasons
  def index
    @seasons = Season.all

    render json: @seasons, include: ['seasons']
  end

  # GET api/v1/private/seasons/1
  def show
    render json: @season, include: ['season']
  end

  # POST api/v1/private/seasons
  def create
    @season = Season.new(season_params)

    if @season.save
      render json: @season, status: :created, location: api_v1_private_season_path(@season), include: ['season']
    else
      render json: @season.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT api/v1/private/seasons/1
  def update
    if @season.update(season_params)
      render json: @season, include: ['season']
    else
      render json: @season.errors, status: :unprocessable_entity
    end
  end

  # DELETE api/v1/private/seasons/1
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
      params.require(:season).permit(:year, :name, :schedule_generated, :active)
    end
end
