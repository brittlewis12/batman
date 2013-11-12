class Song < ActiveRecord::Base
  validates :name, :creator_id, presence: true
  has_many :tracks
  has_many :users, through: :tracks
  belongs_to :creator, class_name: :User, foreign_key: :creator_id
end
