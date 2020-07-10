# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Appointment, type: :model do
  describe 'appointment created by logged in user' do
    before(:all) do
      @user = create(:user)
      @project = create(:project)
    end

    it 'books a new date' do
      new_date = create(:appointment)
      new_date.user_id = @user.id
      new_date.project_id = @project.id
      expect(new_date).to be_valid
    end
  end

  describe 'appointment created by a non-logged in user' do
    before(:all) do
      @random_user = create(:random_user)
      @project = create(:project)
    end

    it 'is invalid without date' do
      new_date = create(:appointment)
      new_date.date = nil
      new_date.user_id = @random_user.id
      new_date.project_id = @project.id
      expect(new_date).to_not be_valid
    end
  end
end
