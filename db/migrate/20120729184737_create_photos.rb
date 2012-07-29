class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :band_site
      t.string :file

      t.timestamps
    end
  end
end
