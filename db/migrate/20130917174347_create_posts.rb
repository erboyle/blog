class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.variable :user_id
      
      t.timestamps
    end
  end
end
