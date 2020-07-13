require 'rails_helper'
RSpec.describe 'api request made via projects_controller', type: :request do
  include ApiHelper

  before(:all) do
    @user = create(:user)
    @project = create(:project)
    5.times do
      @appointment = create(:appointment, user_id: @user.id, project_id: @project.id)
    end
  end

  describe 'Authorization users request' do
    before do
      @token = authenticated_header(@user.id)
    end

    it 'lets an authorized user create an appointment' do
      post '/api/v1/appointments',
           params: {
             appointment: {
               date: '9/7/2020'
             },
             headers: { 'Authorization' => @token }
           }
    end
  end

  describe 'Unauthorized users request' do
    before do
      @token = authenticated_header(@user.id = nil)
    end

    it 'denies access for unauthorized users to create an appointment' do
      post '/api/v1/appointments',
           params: {
             appointment: {
               date: '9/7/2020'
             },
             headers: { 'Authorization' => @token }
           }
    end

    it 'returns listing for all appointments to unauthorized users' do
      get '/api/v1/appointments'
      expect(response).to have_http_status(200)
    end

    it 'show details for selected appointments to unauthorized users' do
      get "/api/v1/appointments/#{@appointment.id}"
      expect(response).to have_http_status(200)
    end
  end
end
