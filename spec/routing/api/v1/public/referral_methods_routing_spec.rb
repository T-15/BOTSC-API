require "rails_helper"

RSpec.describe Api::V1::Public::ReferralMethodsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/v1/public/referral_methods").to route_to("api/v1/public/referral_methods#index")
    end
  end
end
