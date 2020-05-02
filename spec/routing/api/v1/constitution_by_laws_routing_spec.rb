require "rails_helper"

RSpec.describe Api::V1::ConstitutionByLawsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/v1/constitution_by_laws").to route_to("api/v1/constitution_by_laws#index")
    end

    it "routes to #active" do
      expect(get: "/api/v1/constitution_by_laws/active").to route_to("api/v1/constitution_by_laws#active")
    end

    it "routes to #show" do
      expect(get: "/api/v1/constitution_by_laws/1").to route_to("api/v1/constitution_by_laws#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/api/v1/constitution_by_laws").to route_to("api/v1/constitution_by_laws#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/v1/constitution_by_laws/1").to route_to("api/v1/constitution_by_laws#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/v1/constitution_by_laws/1").to route_to("api/v1/constitution_by_laws#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/v1/constitution_by_laws/1").to route_to("api/v1/constitution_by_laws#destroy", id: "1")
    end
  end
end
