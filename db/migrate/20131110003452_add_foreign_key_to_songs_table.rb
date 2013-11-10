class AddForeignKeyToSongsTable < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE songs
          ADD CONSTRAINT fk_users
          FOREIGN KEY (creator_id)
          REFERENCES users(id)
        SQL
      end
    end
  end
end
