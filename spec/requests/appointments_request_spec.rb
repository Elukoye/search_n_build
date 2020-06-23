require 'rails_helper'

RSpec.describe 'GET /v1/appointments' do
    it 'returns a list of created appointments if any' do
        get('/v1/appointments')
        json = JSON.parse(response.body).size
        expect(json).to eq(0)
    end

    it 'returns a status message' do
        get('/v1/appointments')
        json = JSON.parse(response.body)
        expect(:status).to eq(:status) 
    end

end