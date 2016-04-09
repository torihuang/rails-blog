class Heart < ActiveRecord::Base
  belongs_to :heartable, polymorphic: true
  belongs_to :blog
  belongs_to :post
  belongs_to :comment
end
