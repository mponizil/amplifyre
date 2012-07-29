class CreateBandSites < ActiveRecord::Migration
  def change
    create_table :band_sites do |t|
      t.references :user
      t.string :slug
      t.string :name
      t.string :description
      t.string :title
      t.string :phrase

      t.timestamps
    end
  end
end
