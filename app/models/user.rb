class User < ActiveRecord::Base
  has_many :blogs, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :posts, through: :blogs, source: :posts

  def password
    @password ||= BCrypt::Password.new(encrypted_password)
  end

  def password=(password_input)
    @password = BCrypt::Password.create(password_input)
    self.encrypted_password = @password
  end
end
