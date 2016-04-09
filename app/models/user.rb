class User < ActiveRecord::Base
  has_many :blogs, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :posts, through: :blogs, source: :posts

  validates :username, :email, presence: true, uniqueness: true
  validate :valid_password

  def password
    @password ||= BCrypt::Password.new(encrypted_password)
  end

  def password=(password_input)
    @password_input = password_input
    @password = BCrypt::Password.create(password_input)
    self.encrypted_password = @password
  end

  def valid_password
    errors.add(:password, 'must be six characters in length') unless @password_input.length >= 6
  end
end
