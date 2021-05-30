EMAIL = 'test@example.com'
PASSWORD = 'password'

# テストユーザーが存在しないときだけ作成
User.find_or_create_by!(email: EMAIL) do |user|
  user.password = PASSWORD
  puts 'ユーザーの初期データインポートに成功しました。'
end
#値の初期化
    OsName.destroy_all
    Status.destroy_all
    CodingLang.destroy_all
    ImportCsv.os_name_data
    ImportCsv.status_data
    ImportCsv.coding_lang_data