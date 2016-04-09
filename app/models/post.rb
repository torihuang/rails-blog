class Post < ActiveRecord::Base
  belongs_to :blog
  delegate :author, to: :blog
  has_many :taggables, as: :tagged
  has_many :tags, through: :taggables, source: :tag
  has_many :hearts, as: :heartable
  has_many :comments
end
