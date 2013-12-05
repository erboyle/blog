class Image < ActiveRecord::Base
  attr_accessible :post_id, :name, :image  
   belongs_to :post  
   mount_uploader :image, ImageUploader  
end
