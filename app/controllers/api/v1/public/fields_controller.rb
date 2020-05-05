class Api::V1::Public::FieldsController < ApplicationController

  # GET api/v1/publicfields/active
  def active
    @fields = Field.where(active: true)

    render json: @fields
  end

end
