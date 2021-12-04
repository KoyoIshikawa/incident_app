FactoryBot.define do
  factory :status do
    Status.destroy_all
    ImportCsv.status_data
  end
end