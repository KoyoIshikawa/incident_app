class ChangeColumnDefaultSolutionOfIncident < ActiveRecord::Migration[6.1]
SOLUTION = <<"EOS"
【やりたいこと】
【原因】
【対応方法】
【参考資料】
EOS
  def up
    change_column :incidents, :solution, :text, null: false, default: SOLUTION
  end
end
