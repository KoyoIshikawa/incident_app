class AddColumnsToIncidents < ActiveRecord::Migration[6.1]
  def change
    add_reference :incidents, :os_name, null: false, foreign_key: true
    add_reference :incidents, :status, null: false, foreign_key: true
    add_reference :incidents, :coding_lang, null: false, foreign_key: true
  end
end
