class Tag < ActiveRecord::Base
  has_many :taggables
  has_many :blogs, through: :taggables, source: :tagged, source_type: 'Blog'
  has_many :posts, through: :taggables, source: :tagged, source_type: 'Post'

  validates :topic, presence: true

  def self.already_exists(tag)
    Tag.find_by(topic: tag.topic)
  end
end
