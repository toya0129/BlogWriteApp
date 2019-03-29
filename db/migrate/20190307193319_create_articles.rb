class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.integer :user_id, null: false
      t.text :contents
      t.string :picture

      t.timestamps
    end
  end
end
