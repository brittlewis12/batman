class Track < ActiveRecord::Base
  validates :name, :url, :song_id, :user_id, presence: true
  validates :url, uniqueness: true

  belongs_to :user
  belongs_to :song
end
