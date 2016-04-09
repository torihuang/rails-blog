class Blog < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_many :taggables, as: :tagged
  has_many :tags, through: :taggables, source: :tag

  has_many :hearts, as: :heartable
  has_many :posts
end
