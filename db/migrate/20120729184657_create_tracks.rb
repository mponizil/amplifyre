class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.references :album
      t.string :title
      t.string :file
      t.string :artist

      t.timestamps
    end
  end
end
