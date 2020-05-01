class Api::V1::ConstitutionByLawsController < ApplicationController
  before_action :set_constitution_by_law, only: [:show, :update, :destroy]

  # GET api/v1/constitution_by_laws
  def index
    @constitution_by_laws = ConstitutionByLaw.all

    render json: @constitution_by_laws
  end

  # GET api/v1/constitution_by_laws/active
  def active
    @constitution_by_laws = ConstitutionByLaw.where(active: true)

    render json: @constitution_by_laws
  end

  # GET api/v1/constitution_by_laws/1
  def show
    render json: @constitution_by_law
  end

  # POST api/v1/constitution_by_laws
  def create
    @constitution_by_law = ConstitutionByLaw.new(constitution_by_law_params)

    if @constitution_by_law.save
      render json: @constitution_by_law, status: :created, location: api_v1_constitution_by_law_path(@constitution_by_law)
    else
      render json: @constitution_by_law.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT api/v1/constitution_by_laws/1
  def update
    if @constitution_by_law.update(constitution_by_law_params)
      render json: @constitution_by_law
    else
      render json: @constitution_by_law.errors, status: :unprocessable_entity
    end
  end

  # DELETE api/v1/constitution_by_laws/1
  def destroy
    @constitution_by_law.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_constitution_by_law
      @constitution_by_law = ConstitutionByLaw.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def constitution_by_law_params
      params.require(:constitution_by_law).permit(:position, :title, :content, :active)
    end
end
