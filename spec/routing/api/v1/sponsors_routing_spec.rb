require "rails_helper"

RSpec.describe Api::V1::SponsorsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/v1/sponsors").to route_to("api/v1/sponsors#index")
    end

    it "routes to #active" do
      expect(get: "/api/v1/sponsors/active").to route_to("api/v1/sponsors#active")
    end

    it "routes to #show" do
      expect(get: "/api/v1/sponsors/1").to route_to("api/v1/sponsors#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/api/v1/sponsors").to route_to("api/v1/sponsors#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/v1/sponsors/1").to route_to("api/v1/sponsors#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/v1/sponsors/1").to route_to("api/v1/sponsors#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/v1/sponsors/1").to route_to("api/v1/sponsors#destroy", id: "1")
    end
  end
end
