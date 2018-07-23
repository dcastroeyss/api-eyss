class User < ApplicationRecord
  validates :email, :password, presence: true

  def self.generate_token
    token = SecureRandom.uuid
    if User.exists?(token: token)
      token = User.generate_token
    else
      return token
    end
  end
end
