FactoryBot.define do
    factory :constitution_by_law do
        title { Faker::Lorem.word }
        content { Faker::Lorem.paragraph }
    end
end