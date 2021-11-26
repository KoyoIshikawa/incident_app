FactoryBot.define do
  factory :article do
    content{ Faker::Lorem.paragraph }
    incident
    user
  end
end