require 'rails_helper'
RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it 'creates new User' do
    expect(user).to be_valid
  end

  it 'is invalid if username is empty' do
    user.username = nil
    expect(user).not_to be_valid
  end

  it 'is invalid if password is empty' do
    user.password = nil
    expect(user).not_to be_valid
  end

  it 'is invalid if username is not unique' do
    user_2 = user.dup
    user.save
    expect(user_2).not_to be_valid
  end
end


