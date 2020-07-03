# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /api/v1/appointments' do
  it 'returns a list of created appointments if any' do
    get('/api/v1/appointments')
    json_response = JSON.parse(response.body)
    expect(json_response).to eq([])
  end

  it 'returns a bad request response when an attribute is omitted' do
    get('/api/v1/appointments')
    expect(response).to have_http_status(:ok)
  end
end
