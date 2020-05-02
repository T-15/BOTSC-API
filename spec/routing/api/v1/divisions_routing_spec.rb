require "rails_helper"

RSpec.describe Api::V1::DivisionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/v1/divisions").to route_to("api/v1/divisions#index")
    end

    it "routes to #active" do
      expect(get: "/api/v1/divisions/active").to route_to("api/v1/divisions#active")
    end

    it "routes to #show" do
      expect(get: "/api/v1/divisions/1").to route_to("api/v1/divisions#show", id: "1")
    end

    it "routes to #with_teams" do
      expect(get: "/api/v1/divisions/1/with_teams").to route_to("api/v1/divisions#with_teams", id: "1")
    end

    it "routes to #with_teams_full" do
      expect(get: "/api/v1/divisions/1/with_teams_full").to route_to("api/v1/divisions#with_teams_full", id: "1")
    end


    it "routes to #create" do
      expect(post: "/api/v1/divisions").to route_to("api/v1/divisions#create")
    end

    it "routes to #create_with_waiting_list" do
      expect(post: "/api/v1/divisions/create_with_waiting_list").to route_to("api/v1/divisions#create_with_waiting_list")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/v1/divisions/1").to route_to("api/v1/divisions#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/v1/divisions/1").to route_to("api/v1/divisions#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/v1/divisions/1").to route_to("api/v1/divisions#destroy", id: "1")
    end
  end
end
