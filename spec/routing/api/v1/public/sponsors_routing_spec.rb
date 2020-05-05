require "rails_helper"

RSpec.describe Api::V1::Public::SponsorsController, type: :routing do
  describe "routing" do
    it "routes to #active" do
      expect(get: "/api/v1/public/sponsors/active").to route_to("api/v1/public/sponsors#active")
    end
  end
end
