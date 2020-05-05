require "rails_helper"

RSpec.describe Api::V1::Public::PositionsController, type: :routing do
  describe "routing" do
    it "routes to #active" do
      expect(get: "/api/v1/public/positions/active").to route_to("api/v1/public/positions#active")
    end
  end
end
