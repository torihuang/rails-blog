class Tag < ActiveRecord::Base
  has_many :taggables
  has_many :blogs, through: :taggables, source: :blog
  has_many :posts, through: :taggables, source: :post
end
