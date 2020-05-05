require "rails_helper"

RSpec.describe Api::V1::Public::MemberServicesController, type: :routing do
  describe "routing" do
    it "routes to #active" do
      expect(get: "/api/v1/public/member_services/active").to route_to("api/v1/public/member_services#active")
    end
  end
end
