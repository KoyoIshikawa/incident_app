class CreateIncidents < ActiveRecord::Migration[6.1]
  def change
    create_table :incidents do |t|
      t.text :incident, null: false
      t.text :solution, null: false

      t.timestamps
    end
  end
end
