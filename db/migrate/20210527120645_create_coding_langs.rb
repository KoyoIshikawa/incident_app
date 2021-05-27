class CreateCodingLangs < ActiveRecord::Migration[6.1]
  def change
    create_table :coding_langs do |t|
      t.string :name

      t.timestamps
    end
  end
end
