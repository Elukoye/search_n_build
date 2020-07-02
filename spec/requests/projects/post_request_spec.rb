require "rails_helper"

RSpec.describe "POST /api/v1/projects", :type => :request do

  it "returns a 201 status code response" do
    post "/api/v1/projects", 
    :params => { :project => {:title => "Build a rails music board", 
    :description => "Build a rails music board", :hrs => 2.5} }
    expect(response).to have_http_status(:created)
  end

  it "returns a bad request response when an attribute is omitted" do
    post "/api/v1/users", 
    :params => { :project => {:title => "Build a rails music board"} }
    expect(response).to have_http_status(400)
  end

end