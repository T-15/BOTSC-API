require "rails_helper"

RSpec.describe Api::V1::Private::SponsorsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/v1/private/sponsors").to route_to("api/v1/private/sponsors#index")
    end

    it "routes to #show" do
      expect(get: "/api/v1/private/sponsors/1").to route_to("api/v1/private/sponsors#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/api/v1/private/sponsors").to route_to("api/v1/private/sponsors#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/v1/private/sponsors/1").to route_to("api/v1/private/sponsors#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/v1/private/sponsors/1").to route_to("api/v1/private/sponsors#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/v1/private/sponsors/1").to route_to("api/v1/private/sponsors#destroy", id: "1")
    end
  end
end
