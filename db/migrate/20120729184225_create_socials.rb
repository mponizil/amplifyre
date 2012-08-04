class CreateSocials < ActiveRecord::Migration
  def change
    create_table :socials do |t|
      t.references :band_site
      t.string :category
      t.string :link

      t.timestamps
    end
  end
end
