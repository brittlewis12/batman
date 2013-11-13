class RemoveDescColumnFromTracks < ActiveRecord::Migration
  def change
    remove_column :tracks, :desc
  end
end
