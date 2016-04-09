class User < ActiveRecord::Base
  has_many :blogs
  has_many :comments
  has_many :posts, through: :blogs, source: :posts
end
