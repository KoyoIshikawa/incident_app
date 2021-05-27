class CreateIncidents < ActiveRecord::Migration[6.1]
  def change
    create_table :incidents do |t|
      t.text :incident
      t.text :solution

      t.timestamps
    end
  end
end
