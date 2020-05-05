class Api::V1::Public::PositionsController < ApplicationController

  # GET api/v1/public/positions/active
  def active
    @positions = Position.where(active: true)

    render json: @positions
  end

end
