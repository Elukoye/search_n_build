require 'rails_helper'
RSpec.describe Project, type: :model do
    describe 'Project Model Test' do
        it 'creates a new project' do
            new_project = create(:project)
            expect(new_project).to be_valid
        end

        it 'is invalid without a title' do
            new_project = create(:project)
            new_project.title = " "
            expect(new_project).to_not be_valid
        end

        it 'is invalid without a description' do
            new_project = create(:project)
            new_project.description = " "
            expect(new_project).to_not be_valid
        end

        it 'is invalid without hours' do
            new_project = create(:project)
            new_project.hrs = " "
            expect(new_project).to_not be_valid
        end
    end
end