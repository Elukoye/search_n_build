require 'rails_helper.rb'
RSpec.describe 'api request made via projects_controller', type: :request do
  include ApiHelper
  let(:user){create(:user)}
  let(:project){create(:project)}
  let(:project_attr){attributes_for(:project,
       title:'Real Estate App',
       description: 'Create Real Estate App with Ruby on Rails',
       hrs: 2.5)}
  let(:token){authenticated_header(user.id)}


  describe 'Authorization users request' do
    it 'lets an authorized user create a project' do
      expect{post '/api/v1/projects',
      params:{
       project: project_attr
      },
      headers:{'Authorization' => token}}.to change {Project.count}.by(1)
      expect(response).to have_http_status(:created)
    end
  end

  describe 'Unauthorization users requests' do
    it 'denies access for unauthorized users' do
      expect{post '/api/v1/projects',
      params:{project: project_attr}}.to change{Project.count}.by(0)
      expect(response).to have_http_status(401)
    end

    it 'returns listing  for all project to unauthorized users' do
      get '/api/v1/projects'
      expect(response).to have_http_status(200)
    end

    it 'show details for selected project to unauthorized users' do
      get api_v1_project_url(project.id)
      expect(JSON.parse(response.body)).to be_an_instance_of(Hash)
      expect(response).to have_http_status(401)
    end

    it 'denies unauthorized users ability to update a project' do
      put api_v1_project_url(project.id)
      expect(JSON.parse(response.body)).to be_an_instance_of(Hash)
      expect(response).to have_http_status(401)
    end

    it 'denies unauthorized users ability to destroy a project' do
      delete api_v1_project_url(project.id)
      expect(JSON.parse(response.body)).to be_an_instance_of(Hash)
      expect(response).to have_http_status(401)
    end
  end
end
