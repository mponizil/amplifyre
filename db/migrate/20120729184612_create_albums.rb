class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.references :band_site
      t.string :title
      t.string :cover_file

      t.timestamps
    end
  end
end
