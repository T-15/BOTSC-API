class Api::V1::Private::PositionsController < ApplicationController
  before_action :set_position, only: [:show, :update, :destroy]

  # GET api/v1/private/positions
  def index
    @positions = Position.all

    render json: @positions
  end

  # GET api/v1/private/positions/1
  def show
    render json: @position
  end

  # POST api/v1/private/positions
  def create
    @position = Position.new(position_params)

    if @position.save
      render json: @position, status: :created, location: api_v1_private_positions_path(@position)
    else
      render json: @position.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT api/v1/private/positions/1
  def update
    if @position.update(position_params)
      render json: @position
    else
      render json: @position.errors, status: :unprocessable_entity
    end
  end

  # DELETE api/v1/private/positions/1
  def destroy
    @position.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_position
      @position = Position.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def position_params
      params.require(:position).permit(:name, :active)
    end
end
