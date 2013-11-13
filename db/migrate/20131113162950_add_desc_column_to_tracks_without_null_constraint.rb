class AddDescColumnToTracksWithoutNullConstraint < ActiveRecord::Migration
  def change
    add_column :tracks, :desc, :string
  end
end
