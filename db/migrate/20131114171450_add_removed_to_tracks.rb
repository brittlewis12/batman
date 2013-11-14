class AddRemovedToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :removed, :boolean, default: :false
  end
end
