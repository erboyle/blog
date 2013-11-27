class Addaudiotoposts < ActiveRecord::Migration
  def change
    add_column :posts, :audio, :string
    
  end
end
