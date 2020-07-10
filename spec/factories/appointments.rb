# frozen_string_literal: true

FactoryBot.define do
  factory :appointment do
    date { Faker::Date.in_date_period(month: 2) }
    sequence(:user_id) { |n| n }
    sequence(:project_id) { |n| n }
  end
end
