FactoryBot.define do
    factory :member_service do
        name { Faker::Name.name }
        contact_name { Faker::Name.name }
    end
end