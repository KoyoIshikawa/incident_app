class ChangeColumnDefaultSolutionOfIncidents < ActiveRecord::Migration[6.1]
  def change
    change_column :incidents, :solution, :text, null: false, default: "解決方法"
  end
end
