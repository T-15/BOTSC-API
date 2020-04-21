class Api::V1::ConstitutionArticlesController < ApplicationController
  before_action :set_constitution_article, only: [:show, :update, :destroy]

  # GET api/v1/constitution_articles
  def index
    @constitution_articles = ConstitutionArticle.all

    render json: @constitution_articles
  end

  # GET api/v1/constitution_articles/active
  def active
    @constitution_articles = ConstitutionArticle.where(active: true)

    render json: @constitution_articles
  end

  # GET api/v1/constitution_articles/1
  def show
    render json: @constitution_article
  end

  # POST api/v1/constitution_articles
  def create
    @constitution_article = ConstitutionArticle.new(constitution_article_params)

    if @constitution_article.save
      render json: @constitution_article, status: :created, location: api_v1_constitution_article_path(@constitution_article)
    else
      render json: @constitution_article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT api/v1/constitution_articles/1
  def update
    if @constitution_article.update(constitution_article_params)
      render json: @constitution_article
    else
      render json: @constitution_article.errors, status: :unprocessable_entity
    end
  end

  # DELETE api/v1/constitution_articles/1
  def destroy
    @constitution_article.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_constitution_article
      @constitution_article = ConstitutionArticle.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def constitution_article_params
      params.require(:constitution_article).permit(:position, :title, :content, :active)
    end
end
