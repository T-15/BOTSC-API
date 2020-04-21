class Api::V1::SponsorsController < ApplicationController
  before_action :set_sponsor, only: [:show, :update, :destroy]

  # GET api/v1/sponsors
  def index
    @sponsors = Sponsor.all

    render json: @sponsors, include: ['sponsors']
  end

  # GET api/v1/sponsors/active
  def active
    @sponsors = Sponsor.where(active: true)

    render json: @sponsors, include: ['sponsors']
  end

  # GET api/v1/sponsors/1
  def show
    render json: @sponsor, include: ['sponsor']
  end

  # POST api/v1/sponsors
  def create
    @sponsor = Sponsor.new(sponsor_params)

    if @sponsor.save
      render json: @sponsor, status: :created, location: api_v1_sponsor_path(@sponsor), include: ['sponsor']
    else
      render json: @sponsor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT api/v1/sponsors/1
  def update
    if @sponsor.update(sponsor_params)
      render json: @sponsor, include: ['sponsor']
    else
      render json: @sponsor.errors, status: :unprocessable_entity
    end
  end

  # DELETE api/v1/sponsors/1
  def destroy
    @sponsor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sponsor
      @sponsor = Sponsor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sponsor_params
      params.require(:sponsor).permit(:image, :website_url)
    end
end
