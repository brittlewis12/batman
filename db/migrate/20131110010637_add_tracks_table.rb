class AddTracksTable < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, null:false
      t.string :desc, null:false
      t.string :url, null:false
      t.boolean :active, default:true
      t.float :volume, default:1
      t.float :offset, default:0
      t.integer :loop, default:1
      t.integer :song_id, null:false
      t.integer :user_id, null:false
      t.timestamps
    end
  end
end

## "active" and "volume" columns will allow us to persist basic mix information
## "volume" can be a float between 0 and 1
## "offset" and "loop" could be sequencing tools
