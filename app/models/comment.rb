class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :author, class_name: 'User'
  has_many :hearts, as: :heartable

  validates :content, :post_id, :author_id, presence: true
end
