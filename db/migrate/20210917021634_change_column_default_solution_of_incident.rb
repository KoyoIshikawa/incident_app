class ChangeColumnDefaultSolutionOfIncident < ActiveRecord::Migration[6.1]
STR = <<"EOS"
こんにちは
お元気ですか
ではさようなら
EOS
  def up
    change_column :incidents, :solution, :text, null: false, default: STR
  end
end
