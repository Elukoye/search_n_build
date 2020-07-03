# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users request', type: :request do
  describe 'GET /users' do
    it 'returns no created users' do
      get('/users')
      json = JSON.parse(response.body).size
      expect(json).to eq(0)
    end

    it 'returns a status message' do
      get('/users')
      json = JSON.parse(response.body)
      expect(:status).to eq(:status)
    end
  end
end
