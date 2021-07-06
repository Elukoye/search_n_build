FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "Jondoew#{n}"}
    password { 'iammorethansix' } 
  end
end
