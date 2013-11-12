class Song < ActiveRecord::Base
  validates :name, :creator_id, presence: true
  has_many :tracks
  has_many :users, through: :tracks
  belongs_to :creator, foreign_key: 'creator_id', class_name: 'User'
end
