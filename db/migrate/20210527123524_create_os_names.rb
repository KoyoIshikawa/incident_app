class CreateOsNames < ActiveRecord::Migration[6.1]
  def change
    create_table :os_names do |t|
      t.string :name

      t.timestamps
    end
  end
end
