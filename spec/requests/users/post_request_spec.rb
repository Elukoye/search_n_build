# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'POST /api/v1/users', type: :request do
  it 'returns a 201 status code response' do
    post '/api/v1/users',
         params: { user: { username: 'Bridget', password: '123456' } }
    expect(response).to have_http_status(:created)
  end
end
