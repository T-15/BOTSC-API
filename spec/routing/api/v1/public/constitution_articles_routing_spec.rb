require "rails_helper"

RSpec.describe Api::V1::Public::ConstitutionArticlesController, type: :routing do
  describe "routing" do
    it "routes to #active" do
      expect(get: "/api/v1/public/constitution_articles/active").to route_to("api/v1/public/constitution_articles#active")
    end
  end
end
