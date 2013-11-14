class Track < ActiveRecord::Base
  after_initialize :set_removed

  validates :name, :url, :song_id, :user_id, presence: true
  validates :url, uniqueness: true

  belongs_to :user
  belongs_to :song
  
  def set_removed
    self.removed ||= false
  end
end
