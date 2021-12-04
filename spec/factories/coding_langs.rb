FactoryBot.define do
  factory :coding_lang do
    CodingLang.destroy_all
    ImportCsv.coding_lang_data
  end
end