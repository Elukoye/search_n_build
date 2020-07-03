# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'POST /api/v1/appointments', type: :request do
  it 'returns a 201 status code response' do
    post '/api/v1/appointments',
         params: { appointments: { date: '3/7/2020',
                                   user_id: 1, project_id: 2 } }
    expect(response).to have_http_status(:created)
  end

  it 'returns a bad request response when an attribute is omitted' do
    post '/api/v1/users',
         params: { project: { title: 'Build a rails music board' } }
    expect(response).to have_http_status(400)
  end
end
