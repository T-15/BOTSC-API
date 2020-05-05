require "rails_helper"

RSpec.describe Api::V1::Private::MembersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/v1/private/members").to route_to("api/v1/private/members#index")
    end

    it "routes to #active" do
      expect(get: "/api/v1/private/members/active").to route_to("api/v1/private/members#active")
    end

    it "routes to #show" do
      expect(get: "/api/v1/private/members/1").to route_to("api/v1/private/members#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/api/v1/private/members").to route_to("api/v1/private/members#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/v1/private/members/1").to route_to("api/v1/private/members#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/v1/private/members/1").to route_to("api/v1/private/members#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/v1/private/members/1").to route_to("api/v1/private/members#destroy", id: "1")
    end
  end
end
