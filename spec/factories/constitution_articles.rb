FactoryBot.define do
    factory :constitution_article do
        title { Faker::Lorem.word }
        content { Faker::Lorem.paragraph }
    end
end