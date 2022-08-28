FactoryBot.define do
  factory :article do
    content { Faker::Lorem.paragraph }
    incident
    user

    trait :invalid do
      content { nil }
    end
  end
end