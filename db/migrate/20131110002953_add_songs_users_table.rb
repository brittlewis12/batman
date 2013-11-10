class AddSongsUsersTable < ActiveRecord::Migration
  def change
    create_table :songs_users, :id => false do |t|
      t.integer :song_id, null:false 
      t.integer :user_id, null:false
    end
  end
end


## not using primary key on this join table (unnecessary)