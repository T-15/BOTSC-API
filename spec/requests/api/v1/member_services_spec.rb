require 'rails_helper'

RSpec.describe "Api::V1::MemberServices", type: :request do
    # initialize test data 
    let!(:member_services) { create_list(:member_service, 10) }
    let(:member_service_id) { member_services.first.id }

    # Test suite for GET /api/v1/member_services
    describe 'GET /api/v1/member_services' do
        # make HTTP get request before each example
        before { get '/api/v1/member_services', params: {} }

        it 'returns member_services' do
            # Note `json` is a custom helper to parse JSON responses
            expect(json).not_to be_empty
            expect(json.size).to eq(10)
        end

        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end
    end

    # Test suite for GET /api/v1/member_services/active
    describe 'GET /api/v1/member_services/active' do
        # make HTTP get request before each example
        before { get '/api/v1/member_services/active', params: {} }

        it 'returns active member_services' do
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

    # Test suite for GET /api/v1/member_services/:id
    describe 'GET /api/v1/member_services/:id' do
        before { get "/api/v1/member_services/#{member_service_id}", params: {} }

        context 'when the record exists' do
            it 'returns the member_service' do
                expect(json).not_to be_empty
                expect(json['id']).to eq(member_service_id)
            end

            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end
        end

        context 'when the record does not exist' do
            let(:member_service_id) { 100 }

            it 'returns status code 404' do
                expect(response).to have_http_status(404)
            end

            it 'returns a not found message' do
                expect(response.body).to match(/Couldn't find MemberService/)
            end
        end
    end

    # Test suite for POST /api/v1/member_services
    describe 'POST /api/v1/member_services' do
        # valid payload
        let(:valid_attributes) { {
            name: 'Test Name',
            contact_name: 'Test Contact'
        } }.to_json

        let(:invalid_attributes) { {
            name: 'Test Name'
        } }.to_json

        context 'when the request is valid' do
            before { post '/api/v1/member_services', params: valid_attributes }

            it 'creates a member_services' do
                expect(json['name']).to eq('Test Name')
            end

            it 'returns status code 201' do
                expect(response).to have_http_status(201)
            end
        end

        context 'when the request is invalid' do
            before { post '/api/v1/member_services', params: invalid_attributes }

            it 'returns status code 422' do
                expect(response).to have_http_status(422)
            end

            it 'returns a validation failure message' do
                expect(response.body)
                .to match("{\"contact_name\":[\"can't be blank\"]}")
            end
        end
    end

    # Test suite for PUT /api/v1/member_services/:id
    describe 'PUT /api/v1/member_services/:id' do
        let(:valid_attributes) { { title: 'New member_services' }.to_json }

        context 'when the record exists' do
            before { put "/api/v1/member_services/#{member_service_id}", params: valid_attributes }

            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end
        end
    end

    # Test suite for DELETE /api/v1/member_services/:id
    describe 'DELETE /api/v1/member_services/:id' do
        before { delete "/api/v1/member_services/#{member_service_id}", params: {} }

        it 'returns status code 204' do
        expect(response).to have_http_status(204)
        end
    end
end
