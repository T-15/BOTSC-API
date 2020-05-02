require "rails_helper"

RSpec.describe Api::V1::SeasonsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/v1/seasons").to route_to("api/v1/seasons#index")
    end

    it "routes to #active" do
      expect(get: "/api/v1/seasons/active").to route_to("api/v1/seasons#active")
    end

    it "routes to #active_with_divisions" do
      expect(get: "/api/v1/seasons/active_with_divisions").to route_to("api/v1/seasons#active_with_divisions")
    end

    it "routes to #active_with_divisions_teams" do
      expect(get: "/api/v1/seasons/active_with_divisions_teams").to route_to("api/v1/seasons#active_with_divisions_teams")
    end

    it "routes to #show" do
      expect(get: "/api/v1/seasons/1").to route_to("api/v1/seasons#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/api/v1/seasons").to route_to("api/v1/seasons#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/v1/seasons/1").to route_to("api/v1/seasons#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/v1/seasons/1").to route_to("api/v1/seasons#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/v1/seasons/1").to route_to("api/v1/seasons#destroy", id: "1")
    end
  end
end
