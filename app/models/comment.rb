class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :author
  has_many :hearts, as: :heartable
end
