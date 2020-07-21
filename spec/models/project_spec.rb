require 'rails_helper'
RSpec.describe Project, type: :model do
  let(:project){ build(:project) }
  
  it 'creates a new project' do
    expect(project).to be_valid
  end

  it 'is invalid without a title' do
      project.title = ' '
      expect(project).to_not be_valid
  end

  it 'is invalid without a description' do
    project.description = ' '
    expect(project).to_not be_valid
  end

  it 'is invalid without hours' do
    project.hrs = ' '
    expect(project).to_not be_valid
  end

  it 'is invalid if project title is not unique' do
    project_2 = project.dup
    project.save
    expect(project_2).not_to be_valid
  end
end
