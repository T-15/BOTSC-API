require "rails_helper"

RSpec.describe Api::V1::Public::DivisionsController, type: :routing do
  describe "routing" do
    it "routes to #active" do
      expect(get: "/api/v1/public/divisions/active").to route_to("api/v1/public/divisions#active")
    end

    it "routes to #with_teams" do
      expect(get: "/api/v1/public/divisions/1/with_teams").to route_to("api/v1/public/divisions#with_teams", id: "1")
    end

    it "routes to #with_teams_full" do
      expect(get: "/api/v1/public/divisions/1/with_teams_full").to route_to("api/v1/public/divisions#with_teams_full", id: "1")
    end
  end
end
