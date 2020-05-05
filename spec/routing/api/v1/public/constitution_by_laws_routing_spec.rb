require "rails_helper"

RSpec.describe Api::V1::Public::ConstitutionByLawsController, type: :routing do
  describe "routing" do
    it "routes to #active" do
      expect(get: "/api/v1/public/constitution_by_laws/active").to route_to("api/v1/public/constitution_by_laws#active")
    end
  end
end
