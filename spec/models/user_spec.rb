# frozen_string_literal: true

require 'rails_helper'
RSpec.describe User, type: :model do
  it 'creates new User' do
    new_user = create(:user)
    expect(new_user).to be_valid
  end

  it 'is invalid if username is empty' do
    nil_username = create(:user)
    nil_username.username = nil
    expect(nil_username).not_to be_valid
  end

  it 'is invalid if password is empty' do
    nil_username = create(:user)
    nil_username.password = nil
    expect(nil_username).not_to be_valid
  end
end
