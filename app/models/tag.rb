class Tag < ActiveRecord::Base
  belongs_to :user
  has_many :taggings
  has_many :posts, :through => :taggings
end
