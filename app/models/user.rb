class User < ActiveRecord::Base

  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6, maximum: 20 }, on: :create
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    email = email.delete(" ").downcase
    if User.find_by(email: email)
      if User.find_by(email: email).authenticate(password)
        user = User.find_by(email: email)
      else
        nil
      end
    else
      nil
    end
  end

end
