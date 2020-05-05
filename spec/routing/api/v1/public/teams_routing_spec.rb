require "rails_helper"

RSpec.describe Api::V1::Public::TeamsController, type: :routing do
  describe "routing" do
    it "routes to #active" do
      expect(get: "/api/v1/public/teams/active").to route_to("api/v1/public/teams#active")
    end

    it "routes to #full" do
      expect(get: "/api/v1/public/teams/1/full").to route_to("api/v1/public/teams#full", id: "1")
    end
  end
end
