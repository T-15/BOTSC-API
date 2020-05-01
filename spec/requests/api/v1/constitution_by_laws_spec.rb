require 'rails_helper'

RSpec.describe "Api::V1::ConstitutionByLaws", type: :request do
  # initialize test data 
  let!(:constitution_by_laws) { create_list(:constitution_by_law, 10) }
  let(:constitution_by_law_id) { constitution_by_laws.first.id }

  # Test suite for GET /api/v1/constitution_by_laws
  describe 'GET /api/v1/constitution_by_laws' do
      # make HTTP get request before each example
      before { get '/api/v1/constitution_by_laws', params: {} }

      it 'returns constitution_by_laws' do
          # Note `json` is a custom helper to parse JSON responses
          expect(json).not_to be_empty
          expect(json.size).to eq(10)
      end

      it 'returns status code 200' do
          expect(response).to have_http_status(200)
      end
  end

  # Test suite for GET /api/v1/constitution_by_laws/active
  describe 'GET /api/v1/constitution_by_laws/active' do
      # make HTTP get request before each example
      before { get '/api/v1/constitution_by_laws/active', params: {} }

      it 'returns active constitution_by_laws' do
          # Note `json` is a custom helper to parse JSON responses
          expect(json).not_to be_empty
          json.each do |item|
              expect(item["active"]).to match(true)
          end
      end

      it 'returns status code 200' do
          expect(response).to have_http_status(200)
      end
  end

  # Test suite for GET /api/v1/constitution_by_laws/:id
  describe 'GET /api/v1/constitution_by_laws/:id' do
      before { get "/api/v1/constitution_by_laws/#{constitution_by_law_id}", params: {} }

      context 'when the record exists' do
          it 'returns the constitution_article' do
              expect(json).not_to be_empty
              expect(json['id']).to eq(constitution_by_law_id)
          end

          it 'returns status code 200' do
              expect(response).to have_http_status(200)
          end
      end

      context 'when the record does not exist' do
          let(:constitution_by_law_id) { 100 }

          it 'returns status code 404' do
              expect(response).to have_http_status(404)
          end

          it 'returns a not found message' do
              expect(response.body).to match(/Couldn't find ConstitutionByLaw/)
          end
      end
  end

  # Test suite for POST /api/v1/constitution_by_laws
  describe 'POST /api/v1/constitution_by_laws' do
      # valid payload
      let(:valid_attributes) { {
          title: 'Test',
          content: 'This is a paragraph'
      } }.to_json

      let(:invalid_attributes) { {
          title: 'Test'
      } }.to_json

      context 'when the request is valid' do
          before { post '/api/v1/constitution_by_laws', params: valid_attributes }

          it 'creates a constitution_by_laws' do
              expect(json['title']).to eq('Test')
          end

          it 'returns status code 201' do
              expect(response).to have_http_status(201)
          end
      end

      context 'when the request is invalid' do
          before { post '/api/v1/constitution_by_laws', params: invalid_attributes }

          it 'returns status code 422' do
              expect(response).to have_http_status(422)
          end

          it 'returns a validation failure message' do
              expect(response.body)
              .to match("{\"content\":[\"can't be blank\"]}")
          end
      end
  end

  # Test suite for PUT /api/v1/constitution_by_laws/:id
  describe 'PUT /api/v1/constitution_by_laws/:id' do
      let(:valid_attributes) { { title: 'New constitution_by_laws' }.to_json }

      context 'when the record exists' do
          before { put "/api/v1/constitution_by_laws/#{constitution_by_law_id}", params: valid_attributes }

          it 'returns status code 200' do
              expect(response).to have_http_status(200)
          end
      end
  end

  # Test suite for DELETE /api/v1/constitution_by_laws/:id
  describe 'DELETE /api/v1/constitution_by_laws/:id' do
      before { delete "/api/v1/constitution_by_laws/#{constitution_by_law_id}", params: {} }

      it 'returns status code 204' do
      expect(response).to have_http_status(204)
      end
  end
end
