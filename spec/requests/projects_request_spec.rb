# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users request', type: :request do
  describe 'GET /v1/projects' do
    it 'returns created projects' do
      get('/v1/projects')
      json = JSON.parse(response.body).size
      expect(json).to eq(1)
    end

    it 'returns a status message' do
      get('/v1/projects')
      json = JSON.parse(response.body)
      expect(:status).to eq(:status)
    end
  end
end
