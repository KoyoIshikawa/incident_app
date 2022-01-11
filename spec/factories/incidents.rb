FactoryBot.define do
  factory :incident do
    incident { Faker::Lorem.word }
    solution { Faker::Lorem.paragraph }
    association :os_name
    association :coding_lang
    association :status
    association :user

    trait :invalid do
      incident { nil }
    end
  end
end