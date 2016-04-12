class Post < ActiveRecord::Base
  belongs_to :blog
  delegate :author, to: :blog
  has_many :taggables, as: :tagged, dependent: :destroy
  has_many :tags, through: :taggables, source: :tag

  has_many :hearts, as: :heartable, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, :content, :blog_id, presence: true

  def multiple_tags
    tag_string  = ''
    tags.each do |tag|
      tag_string += tag.topic + ","
    end
    tag_string
  end

  def multiple_tags=(tag_array)
    split = tag_array.split(',')
    split.each do |tag_topic|
      self.tags << Tag.create(topic: tag_topic.lstrip) unless tag_topic == ''
    end
  end
end
