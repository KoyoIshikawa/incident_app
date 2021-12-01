FactoryBot.define do
  factory :incident do
    coding_lang_id { CodingLang.find(rand(CodingLang.first.id..CodingLang.last.id)).id }
    incident { Faker::Lorem.word }
    os_name { OsName.find(rand(OsName.first.id..OsName.last.id)) }
    solution { Faker::Lorem.paragraph }
    status { Status.find(rand(Status.first.id..Status.last.id)) }
    user
  end
end