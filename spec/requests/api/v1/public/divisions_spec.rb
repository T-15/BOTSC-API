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

RSpec.describe "/api/v1/public/divisions", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Division. As you add validations to Division, be sure to
  # adjust the attributes here as well.
  let!(:season) { Season.create!(year: 2020, name: '2020') }
  let(:valid_attributes) {
    {
      name: 'Over 45',
      season_id: season.id
    }
  }

  let(:invalid_attributes) {
    {
      season_id: 100
    }
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # DivisionsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /active" do
    it "renders a successful response" do
      Division.create! valid_attributes
      get api_v1_public_divisions_active_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /with_teams" do
    it "renders a successful response" do
      division = Division.create! valid_attributes
      get api_v1_public_division_with_teams_url(division), as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /with_teams_full" do
    it "renders a successful response" do
      division = Division.create! valid_attributes
      get api_v1_public_division_with_teams_full_url(division), as: :json
      expect(response).to be_successful
    end
  end

end
