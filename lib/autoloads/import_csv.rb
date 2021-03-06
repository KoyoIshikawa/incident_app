

class ImportCsv
  # CSVデータのパスを引数として受け取り、インポート処理を実行
  def self.import(path)
    # インポートするための空配列
    list = []
    # CSVファイルからインポートしたデータを格納
      CSV.foreach(path, headers: true) do |row|
        list << row.to_h
      end
    # メソッドの戻り値をインポートしたデータの配列とする
    list
  end
  def self.os_name_data
    # importクラスメソッドを呼び出し，ユーザーデータの配列を生成
    list = import('db/csv_data/OsName_data.csv')

    puts "インポート処理を開始"
    OsName.create!(list)
    puts "インポート完了!"
  end
  def self.status_data
    # importクラスメソッドを呼び出し，ユーザーデータの配列を生成
    list = import('db/csv_data/Status_data.csv')

    puts "インポート処理を開始"
    Status.create!(list)
    puts "インポート完了!"
  end
  def self.coding_lang_data
    # importクラスメソッドを呼び出し，ユーザーデータの配列を生成
    list = import('db/csv_data/CodingLang_data.csv')

    puts "インポート処理を開始"
    CodingLang.create!(list)
    puts "インポート完了!"
  end
end