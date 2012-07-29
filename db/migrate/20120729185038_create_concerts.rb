class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.references :band_site
      t.string :venue
      t.text :details
      t.string :photo

      t.timestamps
    end
  end
end
