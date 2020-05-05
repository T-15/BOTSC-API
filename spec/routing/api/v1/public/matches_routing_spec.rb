require "rails_helper"

RSpec.describe Api::V1::Public::MatchesController, type: :routing do
  describe "routing" do
    it "routes to #full" do
      expect(get: "api/v1/public/matches/1/full").to route_to("api/v1/public/matches#full", id: "1")
    end
  end
end
