# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'POST /api/v1/projects', type: :request do
  it 'returns a 201 status code response' do
    post '/api/v1/projects',
         params: { project: { title: 'Build a rails music board',
                              description: 'Build a rails music board', hrs: 2.5 } }
    expect(response).to have_http_status(:created)
  end
end
