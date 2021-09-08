EMAIL = 'test@example.com'
USERNAME = "testuser"
PASSWORD = 'password'

# テストユーザーが存在しないときだけ作成
User.find_or_create_by!(email: EMAIL) do |user|
  user.password = PASSWORD
  user.username = USERNAME
  puts 'ユーザーの初期データインポートに成功しました。'
end
#値の初期化
    OsName.destroy_all
    Status.destroy_all
    CodingLang.destroy_all
    Incident.destroy_all
    ImportCsv.os_name_data
    ImportCsv.status_data
    ImportCsv.coding_lang_data

require "faker"


# 1000件の初期インシデントデータを投入
puts "インシデント初期データ投稿開始"
1000.times do
  Incident.create!(incident: Faker::Quote.famous_last_words, solution: Faker::Quote.jack_handey, user_id: 1, os_name_id: OsName.find(rand(OsName.first.id..OsName.last.id)).id, status_id: Status.find(rand(Status.first.id..Status.last.id)).id, coding_lang_id: CodingLang.find(rand(CodingLang.first.id..CodingLang.last.id)).id)
end
AdminUser.find_or_create_by!(email: 'admin@example.com') do |adminuser|
  adminuser.password = PASSWORD 
  adminuser.password_confirmation = PASSWORD
end
puts "初期データの投入に成功しました！"