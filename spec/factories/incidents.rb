FactoryBot.define do
  factory :incident do
    ImportCsv.os_name_data
    ImportCsv.status_data
    ImportCsv.coding_lang_data
    coding_lang { CodingLang.find(rand(CodingLang.first.id..CodingLang.last.id)) }
    incident { Faker::Lorem.word }
    os_name { OsName.find(rand(OsName.first.id..OsName.last.id)) }
    solution { Faker::Lorem.paragraph }
    status { Status.find(rand(Status.first.id..Status.last.id)) }
    user
  end
end