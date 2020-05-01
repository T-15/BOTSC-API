require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/api/v1/member_services", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # MemberService. As you add validations to MemberService, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
        name: Faker::Name.name,
        contact_name: Faker::Name.name
    }
  }

  let(:invalid_attributes) {
    {
        fail: Faker::Name.name
    }
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # MemberServicesController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      MemberService.create! valid_attributes
      get api_v1_member_services_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /active" do
    it "renders a successful response" do
      MemberService.create! valid_attributes
      get active_api_v1_member_services_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      member_service = MemberService.create! valid_attributes
      get api_v1_member_service_url(member_service), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new MemberService" do
        expect {
          post api_v1_member_services_url,
               params: { member_service: valid_attributes }, headers: valid_headers, as: :json
        }.to change(MemberService, :count).by(1)
      end

      it "renders a JSON response with the new api/v1_member_service" do
        post api_v1_member_services_url,
             params: { member_service: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new MemberService" do
        expect {
          post api_v1_member_services_url,
               params: { member_service: invalid_attributes }, as: :json
        }.to change(MemberService, :count).by(0)
      end

      it "renders a JSON response with errors for the new api/v1_member_service" do
        post api_v1_member_services_url,
             params: { member_service: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested api/v1_member_service" do
      member_service = MemberService.create! valid_attributes
      expect {
        delete api_v1_member_service_url(member_service), headers: valid_headers, as: :json
      }.to change(MemberService, :count).by(-1)
    end
  end
end