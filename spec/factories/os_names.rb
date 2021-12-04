FactoryBot.define do
  factory :os_name do
    OsName.destroy_all
    ImportCsv.os_name_data
  end
end