class Api::V1::DivisionsController < ApplicationController
  before_action :set_division, only: [:show, :with_teams, :with_teams_full, :update, :destroy]

  # GET api/v1/divisions
  def index
    @divisions = Division.all

    render json: @divisions, include: ['divisions']
  end

  # GET api/v1/divisions/active
  def active
    @divisions = Division.where(active: true)

    render json: @divisions, include: ['divisions']
  end

  # GET api/v1/divisions/1
  def show
    render json: @division, include: ['division']
  end

  # GET api/v1/divisions/1/with_teams
  def with_teams
    render json: @division, include: ['teams']
  end

  # GET api/v1/divisions/1/with_teams_full
  def with_teams_full
    render json: @division, include: ['teams', 'teams.sponsor', 'teams.convenor']
  end

  # POST api/v1/divisions
  def create
    @division = Division.new(division_params)

    if @division.save
      render json: @division, status: :created, location: api_v1_division_path(@division), include: ['division']
    else
      render json: @division.errors, status: :unprocessable_entity
    end
  end

  # POST api/v1/divisions/create_with_waiting_list
  def create_with_waiting_list
    Division.transaction do
      @division = Division.new(division_params)
      wait_list = WaitingList.create(name: @division.name + " Waiting List", division: @division)
    end

    if @division.save
      render json: @division, status: :created, location: api_v1_division_path(@division), include: ['division', 'waiting_list']
    else
      render json: @division.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT api/v1/divisions/1
  def update
    if @division.update(division_params)
      render json: @division, include: ['division']
    else
      render json: @division.errors, status: :unprocessable_entity
    end
  end

  # DELETE api/v1/divisions/1
  def destroy
    @division.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_division
      @division = Division.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def division_params
      params.require(:division).permit(:name, :season_id, :active)
    end
end
