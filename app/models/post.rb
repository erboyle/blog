class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, :through => :taggings
  validates :title, presence: true, length: { minimum: 5 }
  validates :text, presence: true
  belongs_to :user
end
