class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :password, length: {minimum: 3}, presence: true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase);
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end
  
end