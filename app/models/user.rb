require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  has_many :blogs, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :posts, through: :blogs, source: :posts

  validates :username, :email, presence: true, uniqueness: true
  # validate :valid_password

  def password
    @password = BCrypt::Password.new(encrypted_password)
  end

  def password=(password_input)
    @password_input = password_input
    @password = BCrypt::Password.create(password_input)
    self.encrypted_password = @password
  end

  def self.authenticate(args)
    user = User.find_by(username: args[:username])
    puts "============================"
    puts user
    puts args
    puts args[:password]
    puts user.password == args[:password]
    if user && user.password == args[:password]
      puts "HERE"
      return user
    else
      return nil
    end
  end

  # def valid_password
  #   errors.add(:password, 'must be six characters in length') unless @password_input.length >= 6
  # end
end
