class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.text :comments

      t.timestamps null: false
    end
  end
end
