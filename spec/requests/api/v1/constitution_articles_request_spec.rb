require 'rails_helper'

RSpec.describe "Api::V1::ConstitutionArticles", type: :request do
    # initialize test data 
    let!(:constitution_articles) { create_list(:constitution_article, 10) }
    let(:constitution_article) { constitution_article.first }

    # Test suite for GET /constitution_articles
    describe 'GET /constitution_articles' do
        # make HTTP get request before each example
        before { get '/constitution_articles', params: {} }

        it 'returns constitution_articles' do
            # Note `json` is a custom helper to parse JSON responses
            expect(json).not_to be_empty
            expect(json.size).to eq(10)
        end

        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end
    end

    # Test suite for GET /constitution_articles/:id
    describe 'GET /constitution_articles/:id' do
        before { get "/constitution_articles/#{constitution_article.id}", params: {} }

        context 'when the record exists' do
            it 'returns the constitution_article' do
                expect(json).not_to be_empty
                expect(json['id']).to eq(constitution_article.id)
            end

            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end
        end

        context 'when the record does not exist' do
            let(:constitution_article.id) { 100 }

            it 'returns status code 404' do
                expect(response).to have_http_status(404)
            end

            it 'returns a not found message' do
                expect(response.body).to match(/Couldn't find ConstitutionArticle/)
            end
        end
    end

    # Test suite for POST /constitution_articles
    describe 'POST /constitution_articles' do
        # valid payload
        let(:valid_attributes) { {
            title: 'Test',
            content: 'This is a paragraph'
            }.to_json }

        context 'when the request is valid' do
            before { post '/constitution_articles', params: valid_attributes }

            it 'creates a constitution_articles' do
                expect(json['title']).to eq('Test')
            end

            it 'returns status code 201' do
                expect(response).to have_http_status(201)
            end
        end

        context 'when the request is invalid' do
            before { post '/constitution_articles', params: { name: 'Foobar' }.to_json }

            it 'returns status code 422' do
                expect(response).to have_http_status(422)
            end

            it 'returns a validation failure message' do
                expect(response.body)
                .to match(/Validation failed: Content can't be blank/)
            end
        end
    end

    # Test suite for PUT /constitution_articles/:id
    describe 'PUT /constitution_articles/:id' do
        let(:valid_attributes) { { title: 'New constitution_articles' }.to_json }

        context 'when the record exists' do
            before { put "/constitution_articles/#{constitution_article.id}", params: valid_attributes }

            it 'updates the record' do
                expect(response.body).to be_empty
            end

            it 'returns status code 204' do
                expect(response).to have_http_status(204)
            end
        end
    end

    # Test suite for DELETE /constitution_articles/:id
    describe 'DELETE /constitution_articles/:id' do
        before { delete "/constitution_articles/#{constitution_article.id}", params: {} }

        it 'returns status code 204' do
        expect(response).to have_http_status(204)
        end
    end

end