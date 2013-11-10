class AddSongsTable < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name, null: false
      t.integer :creator_id, null: false
      t.timestamps
    end
  end
end


