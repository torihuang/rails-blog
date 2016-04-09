class Taggable < ActiveRecord::Base
  belongs_to :tagged, polymorphic: true
  belongs_to :tag
  belongs_to :blog
  belongs_to :post
end
