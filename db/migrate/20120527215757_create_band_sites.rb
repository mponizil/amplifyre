class CreateBandSites < ActiveRecord::Migration
  def change
    create_table :band_sites do |t|
      t.integer :user_id
      t.string :slug
      t.string :name
      t.string :description
      t.string :title
      t.string :phrase

      t.timestamps
    end
  end
end
