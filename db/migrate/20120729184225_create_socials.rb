class CreateSocials < ActiveRecord::Migration
  def change
    create_table :socials do |t|
      t.references :band_site
      t.string :type
      t.string :link

      t.timestamps
    end
  end
end
