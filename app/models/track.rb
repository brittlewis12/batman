class Track < ActiveRecord::Base

  validates :name, :desc, :url, :active, :volume, :offset, :loop, :song_id, :user_id, presence: true
  validates :url, uniqueness: true

  belongs_to :user
  belongs_to :song

  mount_uploader :track_file, TrackUploader

end
