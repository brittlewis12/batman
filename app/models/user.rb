class User < ActiveRecord::Base

  validates :username, :email, :password_digest, presence: true

  validates :username, :email, uniqueness: true

  has_secure_password

  has_many :tracks

  has_many :songs, through: :tracks

  has_many :created_songs, class_name: :Song, foreign_key: :creator_id

end
