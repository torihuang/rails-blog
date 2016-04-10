class Post < ActiveRecord::Base
  belongs_to :blog
  delegate :author, to: :blog
  has_many :taggables, as: :tagged, dependent: :destroy
  has_many :tags, through: :taggables, source: :tag

  has_many :hearts, as: :heartable, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, :content, :blog_id, presence: true
end
