require "rails_helper"

RSpec.describe Api::V1::Public::SeasonsController, type: :routing do
  describe "routing" do
    it "routes to #active" do
      expect(get: "/api/v1/public/seasons/active").to route_to("api/v1/public/seasons#active")
    end

    it "routes to #active_with_divisions" do
      expect(get: "/api/v1/public/seasons/active_with_divisions").to route_to("api/v1/public/seasons#active_with_divisions")
    end

    it "routes to #active_with_divisions_teams" do
      expect(get: "/api/v1/public/seasons/active_with_divisions_teams").to route_to("api/v1/public/seasons#active_with_divisions_teams")
    end
  end
end
