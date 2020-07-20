require 'rails_helper'
RSpec.describe 'api request made via projects_controller', type: :request do
  include ApiHelper

    let(:user){create(:user)}
    let(:project){create(:project)}
    let(:appointment_attr){attributes_for(:appointment,date:'20/7/2020',user_id:user.id,project_id:project.id)}
    let(:token){authenticated_header(user.id)}
    let(:appointment){create(:appointment, user_id:user.id, project_id: project.id)}
 
  describe 'Authorization users request' do
    it 'lets an authorized user create an appointment' do
      expect{post api_v1_appointments_url,
      params: {
        appointment: appointment_attr
      },
      headers:{'Authorization' => token}}.to change {Appointment.count}.by(1)
      # expect(response).to have_http_status(:created)
    end

    it 'lets an authorized user update an appointment' do
      user = create(:user)
      project = create(:project)
      appointment = create(:appointment,user_id: user.id, project_id: project.id)
    end

    it 'lets an authorized user destroy an appointment' do
      user = create(:user)
      project = create(:project)
      appointment = create(:appointment,user_id: user.id, project_id: project.id)
      expect{delete "/api/v1/appointments/#{appointment.id}",
      headers:{'Authorization' => token}}.to change {Appointment.count}.by(-1)
    end
  end

  describe 'Unauthorized users request' do
    it 'denies access for unauthorized users to create an appointment' do
      expect{post api_v1_appointments_url,
      params:{appointment:appointment_attr}}.to change{Appointment.count}.by(0)
      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns listing for all appointments to unauthorized users' do
      get '/api/v1/appointments'
      expect(JSON.parse(response.body)).to be_an_instance_of(Hash)
      expect(response).to have_http_status(:unauthorized)
    end

    it 'show details for selected appointments to unauthorized users' do
      get api_v1_appointment_url(appointment.id)
      expect(JSON.parse(response.body)).to be_an_instance_of(Hash)
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
