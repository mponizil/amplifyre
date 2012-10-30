class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.references :band_site
      t.references :album
      t.integer :position, :default => 1
      t.string :title
      t.string :file
      t.string :artist

      t.timestamps
    end
  end
end
