# frozen_string_literal: truerequire 
'rails_helper'RSpec.describe Appointment, type: :request do  
    include ApiHelper  
    let(:user) { create(:user )}  
    let (:project) { create(:project) }  
    let (:appt_attributes) { attributes_for(:appointment,date: '9/7/2020', user_id: user.id, project_id: project.id)}  
    let(:token) { authenticated_header(user.id) } 
    let(:appointment) { create(:appointment, user_id: user.id, project_id: project.id) }  

    describe 'Authorization users request' do    
        it 'lets an authorized user create an appointment' do      
						expect {post api_v1_appointments_url, 
						params: {appointment: appt_attributes, 
            },           
						headers: { 'Authorization' => token }}.to change {Appointment.count }.by(1)     
					 expect(response).to have_http_status(:created) end  
		end  
		describe 'Unauthorized users request' do    
			it 'denies access for unauthorized users to create an appointment' do 
					expect {post api_v1_appointments_url, 
					params: { appointment: appt_attributes }}.to change{ Appointment.count }.by(0)      
					expect(response).to have_http_status(:unauthorized)    
			end   

      it 'returns listing for all appointments to unauthorized users' do      
            get api_v1_appointments_url      
            expect(JSON.parse(response.body)).to be_an_instance_of(Array)      
            expect(response).to have_http_status(:ok)    
          
      end    
      
      it 'show details for selected appointments to unauthorized users' do 
            get api_v1_appointment_url(appointment.id)      
            expect(JSON.parse(response.body)).to have_key('date')      
            expect(response).to have_http_status(:ok)    
      end  
    end
end