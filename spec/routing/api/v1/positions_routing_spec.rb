require "rails_helper"

RSpec.describe Api::V1::PositionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/v1/positions").to route_to("api/v1/positions#index")
    end

    it "routes to #active" do
      expect(get: "/api/v1/positions/active").to route_to("api/v1/positions#active")
    end

    it "routes to #show" do
      expect(get: "/api/v1/positions/1").to route_to("api/v1/positions#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/api/v1/positions").to route_to("api/v1/positions#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/v1/positions/1").to route_to("api/v1/positions#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/v1/positions/1").to route_to("api/v1/positions#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/v1/positions/1").to route_to("api/v1/positions#destroy", id: "1")
    end
  end
end
