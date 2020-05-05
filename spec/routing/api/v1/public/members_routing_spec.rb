require "rails_helper"

RSpec.describe Api::V1::Public::MembersController, type: :routing do
  describe "routing" do
    it "routes to #deceased" do
      expect(get: "/api/v1/public/members/deceased").to route_to("api/v1/public/members#deceased")
    end
  end
end
