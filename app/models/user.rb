class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  # def self.sign_in_from_facebook(auth)
  #   find_by(provider: auth['provider'], uid: auth['uid'] ) || create_user_from_facebook(auth)
  # end
  #
  # def self.create_user_from_facebook(auth)
  #   create(
  #   email: auth['info']['email'],
  #   provider: auth['provider'],
  #   uid: auth['uid'],
  #   username: auth['info']['name'],
  #   gender: auth['extra']['raw_info']['gender'],
  #   date_of_birth: auth['extra']['raw_info']['birthday'],
  #   bio: auth['extra']['raw_info']['bio']
  #
  #   )
  # end

end
