class User < ActiveRecord::Base

  validates :username, :email, :password_digest, presence: true

  validates :username, :email, uniqueness: true

  has_secure_password

  has_many :tracks

  has_many :songs, through: :tracks

end