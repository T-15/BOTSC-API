require "rails_helper"

RSpec.describe Api::V1::Private::DivisionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/v1/private/divisions").to route_to("api/v1/private/divisions#index")
    end

    it "routes to #show" do
      expect(get: "/api/v1/private/divisions/1").to route_to("api/v1/private/divisions#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/api/v1/private/divisions").to route_to("api/v1/private/divisions#create")
    end

    it "routes to #create_with_waiting_list" do
      expect(post: "/api/v1/private/divisions/create_with_waiting_list").to route_to("api/v1/private/divisions#create_with_waiting_list")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/v1/private/divisions/1").to route_to("api/v1/private/divisions#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/v1/private/divisions/1").to route_to("api/v1/private/divisions#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/v1/private/divisions/1").to route_to("api/v1/private/divisions#destroy", id: "1")
    end
  end
end
