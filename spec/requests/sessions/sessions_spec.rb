require 'rails_helper'
RSpec.describe 'api request made via sessions_controller', type: :request do
  before(:all) do
    create(:user)
  end

  describe 'login a user' do
    it 'if sign up is successful' do
      post '/api/v1/sessions',
           params: {
             username: 'Jondoew',
             password: 'iammorethansix'
           }
      expect(response).to have_http_status(200)
    end
  end

  describe 'unsuccesful login' do
    it 'if sign up is unsuccessful' do
      post '/api/v1/sessions',
           params: {
             username: 'Jondoew',
             password: 'unknownpassword'
           }
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
