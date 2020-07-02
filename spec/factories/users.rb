FactoryBot.define do
    factory :user do
        username {Faker::FunnyName.name}
        password {"1234567"}
    end
end