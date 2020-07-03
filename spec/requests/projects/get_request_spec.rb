# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /api/v1/projects', type: :request do
  it 'returns empty array if no project exists' do
    get('/api/v1/projects')
    json_reponse = JSON.parse(response.body)
    expect(json_reponse).to eq([])
  end

  it 'returns a 200 OK status code when request is processed' do
    get('/api/v1/projects')
    expect(response).to have_http_status(:ok)
  end
end
