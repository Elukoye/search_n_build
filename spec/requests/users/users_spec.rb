require 'rails_helper'
RSpec.describe 'api request from the UsersController', type: :request do

  describe 'post myestateapi/users with complete params' do
    before do
      post '/api/v1/users',
        params: { user: {
               username: 'addo',
               password: 'iammorethansix',
        } }
    end

    it 'returns a successfully created User' do
      expect(response).to have_http_status(201)
    end
  end

  describe 'post myestateapi/users with incomplete params' do
    before do
      post '/api/v1/users',
        params: { user: {
               username: 'addo',
               password: '',
        } }
    end

    it 'returns status code bad request for unsuccessful signup' do
      expect(response).to have_http_status(400)
    end
  end
end