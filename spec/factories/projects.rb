# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    title { Faker::Lorem.sentence(word_count: 3) }
    description { Faker::Lorem.sentences(number: 1) }
    hrs { 2.5 }
  end
end
