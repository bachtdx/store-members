require 'rails_helper'

RSpec.describe 'Administrators API', type: :request do
  let(:administrator) { build(:administrator) }
  let(:user) {build(:user)}
  let(:headers) { valid_headers_admin.except('Authorization') }
  let(:user_id) { user.id }

  describe 'GET /list-users' do
    # make HTTP get request before each example
    before { get '/list-users', params: {}, headers: headers }

    it 'returns todos' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
    end

    it 'returns status code 422' do
      expect(response).to have_http_status(422)
    end
  end

  describe 'PUT /edit-user' do
    let(:valid_attributes) { { id: user.id, name: user.name, email: user.email }.to_json }

    context 'when the record exists' do
      before { put "/edit-user", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body)
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'DELETE /delete-user' do
    before { delete "/delete-user?#{user_id}", params: {}, headers: headers }

    it 'returns status code 422' do
      expect(response).to have_http_status(422)
    end
  end

  describe 'GET /search-user' do
    # make HTTP get request before each example
    before { get '/search-user', params: {key: 'a'}, headers: headers }

    it 'returns todos' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
    end

    it 'returns status code 422' do
      expect(response).to have_http_status(422)
    end
  end


end