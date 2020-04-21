class Api::V1::FieldsController < ApplicationController
  before_action :set_field, only: [:show, :update, :destroy]

  # GET api/v1/fields
  def index
    @fields = Field.all

    render json: @fields
  end

  # GET api/v1/fields/active
  def active
    @fields = Field.where(active: true)

    render json: @fields
  end

  # GET api/v1/fields/1
  def show
    render json: @field
  end

  # POST api/v1/fields
  def create
    @field = Field.new(field_params)

    if @field.save
      render json: @field, status: :created, location: api_v1_field_path(@field)
    else
      render json: @field.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT api/v1/fields/1
  def update
    if @field.update(field_params)
      render json: @field
    else
      render json: @field.errors, status: :unprocessable_entity
    end
  end

  # DELETE api/v1/fields/1
  def destroy
    @field.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_field
      @field = Field.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def field_params
      params.require(:field).permit(:name, :google_maps_url, :active)
    end
end
