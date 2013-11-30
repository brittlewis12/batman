class Track < ActiveRecord::Base
  after_initialize :set_removed

  validates :name, :url, :song_id, :user_id, presence: true
  validates :url, uniqueness: true
  validates_inclusion_of :removed, :in => [true, false]

  belongs_to :user
  belongs_to :song
  
  def set_removed
    self.removed ||= false
  end
end
