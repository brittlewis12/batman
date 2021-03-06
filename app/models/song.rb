class Song < ActiveRecord::Base
  validates :name, :creator_id, presence: true

  has_many :tracks
  has_and_belongs_to_many :users
  
  belongs_to :creator, class_name: :User, foreign_key: :creator_id
end
