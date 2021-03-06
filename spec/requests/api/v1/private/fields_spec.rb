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

RSpec.describe "/api_v1/private/fields", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Field. As you add validations to Field, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {
    name: Faker::Lorem.word,
    google_maps_url: Faker::Internet.url
  } }

  let(:invalid_attributes) { {
    fail: Faker::Lorem.word
  } }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # FieldsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {
      "authorization": 'Bearer ' + get_token
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Field.create! valid_attributes
      get api_v1_private_fields_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      field = Field.create! valid_attributes
      get api_v1_private_field_url(field), headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Field" do
        expect {
          post api_v1_private_fields_url,
               params: { field: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Field, :count).by(1)
      end

      it "renders a JSON response with the new field" do
        post api_v1_private_fields_url,
             params: { field: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Field" do
        expect {
          post api_v1_private_fields_url,
               params: { field: invalid_attributes }, headers: valid_headers, as: :json
        }.to change(Field, :count).by(0)
      end

      it "renders a JSON response with errors for the new field" do
        post api_v1_private_fields_url,
             params: { field: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested field" do
      field = Field.create! valid_attributes
      expect {
        delete api_v1_private_field_url(field), headers: valid_headers, as: :json
      }.to change(Field, :count).by(-1)
    end
  end
end
