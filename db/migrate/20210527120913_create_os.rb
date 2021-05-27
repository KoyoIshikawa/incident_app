class CreateOs < ActiveRecord::Migration[6.1]
  def change
    create_table :os do |t|
      t.string :name

      t.timestamps
    end
  end
end
