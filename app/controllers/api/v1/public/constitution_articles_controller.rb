class Api::V1::Public::ConstitutionArticlesController < ApplicationController

  # GET api/v1/public/constitution_articles/active
  def active
    @constitution_articles = ConstitutionArticle.where(active: true)

    render json: @constitution_articles
  end

end
