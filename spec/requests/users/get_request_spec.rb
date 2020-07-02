require "rails_helper"

RSpec.describe "GET /api/v1/users",:type => :request do
    it "returns empty array if no user exists " do
        get("/api/v1/users")
        json_response = JSON.parse(response.body) 
        expect( json_response).to eq([])
    end
        
    it "returns a 200 OK status code when request is processed" do
        get("/api/v1/users")
        json_response = JSON.parse(response.body) 
        expect(response).to have_http_status(200)
    end

    
end