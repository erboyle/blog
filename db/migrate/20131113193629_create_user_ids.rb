class CreateUserIds < ActiveRecord::Migration
  def change
    create_table :user_ids do |t|
      t.references :user, index: true
      t.references :post, index: true

      t.timestamps
    end
  end
end
