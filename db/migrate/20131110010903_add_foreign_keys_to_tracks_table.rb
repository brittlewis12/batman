class AddForeignKeysToTracksTable < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE tracks
          ADD CONSTRAINT fk_users
          FOREIGN KEY (user_id)
          REFERENCES users(id),

          ADD CONSTRAINT fk_songs
          FOREIGN KEY (song_id)
          REFERENCES songs(id)
        SQL
      end
    end
  end
end
