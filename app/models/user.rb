class User < ActiveRecord::Base
  has_many :questions
  attr_accessor :password
  validates_confirmation_of :password
  before_create :encrypt_password
  validates :username, :presence => true
  validates :password, :presence => true, :on => :create

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(username, password)
    user = User.where(username: username).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def send_welcome_email
    UserMailer.welcome_email(self).deliver
  end

  def admin?
    self.admin
  end
end
