# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :appointments
  has_many :users, through: :appointments
end
