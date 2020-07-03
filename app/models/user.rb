# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :appointments
  has_many :projects, through: :appointments

  validates :username, presence: true, length: { maximum: 10 }
  validates :password, presence: true, length: { minimum: 6 }
end
