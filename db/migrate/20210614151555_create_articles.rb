class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.references :user, null: false, foreign_key: true
      t.references :incident, null: false, foreign_key: true
      t.text :content, null: false

      t.timestamps
    end
  end
end
