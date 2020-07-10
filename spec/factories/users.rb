# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { 'Jondoew' }
    password { 'iammorethansix' }
  end

  factory :random_user, class: User do
    username { 'Jendoew' }
    password { 'iammorethanenough' }
  end
end
