require "rails_helper"

RSpec.describe Api::V1::Private::MemberServicesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/v1/private/member_services").to route_to("api/v1/private/member_services#index")
    end

    it "routes to #show" do
      expect(get: "/api/v1/private/member_services/1").to route_to("api/v1/private/member_services#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/api/v1/private/member_services").to route_to("api/v1/private/member_services#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/v1/private/member_services/1").to route_to("api/v1/private/member_services#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/v1/private/member_services/1").to route_to("api/v1/private/member_services#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/v1/private/member_services/1").to route_to("api/v1/private/member_services#destroy", id: "1")
    end
  end
end
