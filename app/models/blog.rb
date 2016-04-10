class Blog < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_many :taggables, as: :tagged, dependent: :destroy
  has_many :tags, through: :taggables, source: :tag

  has_many :hearts, as: :heartable, dependent: :destroy
  has_many :posts, dependent: :destroy

  validates :title, :description, :author_id, presence: true
end
