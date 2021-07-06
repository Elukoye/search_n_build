require 'rails_helper'
RSpec.describe Appointment, type: :model do
  describe 'creating an appointment by authorized user' do
    before(:all) do
      @user = create(:user)
      @project = create(:project)
    end

    it 'creates a new appointment' do
      appointment = create(:appointment)
      appointment.user_id = @user.id
      appointment.project_id = @project.id
      expect(appointment).to be_valid
    end
  end

  describe 'appointment with missing params' do
    before(:all) do
      @user_2 = create(:user)
      @project_2 = create(:project)
    end

    it 'is invalid without date' do
      appointment = create(:appointment)
      appointment.date = nil
      appointment.user_id = @user_2.id
      appointment.project_id = @project_2.id
      expect(appointment).to_not be_valid
    end
  end

  describe 'appointment created by a non-authorized user' do
    before(:all) do
      @user_3 = create(:user)
      @project_3 = create(:project)
    end

    it 'is invalid without authorized user' do
      appointment = create(:appointment)
      appointment.user_id = nil
      expect(appointment).to_not be_valid
    end
  end
   
  describe 'appointment created without project params' do
    before(:all) do
      @user_4 = create(:user)
      @project_4 = create(:project)
    end

    it 'is invalid without project_id' do
      appointment = create(:appointment)
      appointment.user_id = @user_4.id
      appointment.project_id = nil
      expect(appointment).to_not be_valid
    end
  end
   

end
