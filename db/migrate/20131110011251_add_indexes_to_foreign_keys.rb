class AddIndexesToForeignKeys < ActiveRecord::Migration
  def change
    add_index :songs_users, :user_id
    add_index :songs_users, :song_id

    add_index :songs, :creator_id

    add_index :tracks, :user_id
    add_index :tracks, :song_id
  end
end

