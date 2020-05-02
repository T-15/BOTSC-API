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

RSpec.describe "/api/v1/members", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Member. As you add validations to Member, be sure to
  # adjust the attributes here as well.
  let(:status) {Status.create!(name: "New Applicant")}
  let(:valid_attributes) {
    {
      status_id: status.id,
      first_name: "Joe",
      last_name: "Smith",
      phone: '1234567890',
      email: 'js@me.com',
      birthday: '1964/06/27',
      postal_code: 'L7L2L9',
      member_since: 2009
    }
  }

  let(:invalid_attributes) {
    {
      status_id: 100
    }
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # MembersController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Member.create! valid_attributes
      get api_v1_members_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /active" do
    it "renders a successful response" do
      Member.create! valid_attributes
      get active_api_v1_members_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /deceased" do
    it "renders a successful response" do
      Member.create! valid_attributes
      get deceased_api_v1_members_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      member = Member.create! valid_attributes
      get api_v1_member_url(member), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Member" do
        expect {
          post api_v1_members_url,
               params: { member: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Member, :count).by(1)
      end

      it "renders a JSON response with the new member" do
        post api_v1_members_url,
             params: { member: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Member" do
        expect {
          post api_v1_members_url,
               params: { member: invalid_attributes }, as: :json
        }.to change(Member, :count).by(0)
      end

      it "renders a JSON response with errors for the new member" do
        post api_v1_members_url,
             params: { member: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          email: 'js@me.ca'
        }
      }

      it "updates the requested member" do
        member = Member.create! valid_attributes
        patch api_v1_member_url(member),
              params: { member: new_attributes }, headers: valid_headers, as: :json
        member.reload
        expect(member.email).to eq("js@me.ca")
      end

      it "renders a JSON response with the member" do
        member = Member.create! valid_attributes
        patch api_v1_member_url(member),
              params: { member: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq("application/json")
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the member" do
        member = Member.create! valid_attributes
        patch api_v1_member_url(member),
              params: { member: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested member" do
      member = Member.create! valid_attributes
      expect {
        delete api_v1_member_url(member), headers: valid_headers, as: :json
      }.to change(Member, :count).by(-1)
    end
  end
end
