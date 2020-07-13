require 'rails_helper.rb'
RSpec.describe 'api request made via projects_controller', type: :request do
  include ApiHelper
  before(:all) do
    @user = create(:user)
    10.times do
      @project = create(:project)
    end
  end

  describe 'Authorization users request' do
    before do
      @token = authenticated_header(@user.id)
    end

    it 'lets an authorized user create a project' do
      post '/api/v1/projects',
           params: {
             project: {
               title: 'Real Estate App',
               description: 'Create Real Estate App with Ruby on Rails',
               hrs: 2.5
             },
             headers: { 'Authorization' => @token }
           }
    end
  end

  describe 'Unauthorization users requests' do
    before do
      @token = authenticated_header(@user.id = nil)
    end

    it 'denies access for unauthorized users' do
      post '/api/v1/projects',
           params: {
             project: {
               title: 'Real Estate App',
               description: 'Create Real Estate App with Ruby on Rails',
               hrs: 2.5
             },
             headers: { 'Authorization' => @token }
           }
      expect(response).to have_http_status(401)
    end

    it 'returns listing  for all project to unauthorized users' do
      get '/api/v1/projects'
      expect(response).to have_http_status(200)
    end

    it 'show details for selected project to unauthorized users' do
      get "/api/v1/projects/#{@project.id}"
      expect(response).to have_http_status(200)
    end
  end
end
