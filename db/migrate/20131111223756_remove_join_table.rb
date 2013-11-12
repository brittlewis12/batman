class RemoveJoinTable < ActiveRecord::Migration
  def change
    drop_table :songs_users
  end
end



##we don't need the join table: the tracks table functions as a songs users table
