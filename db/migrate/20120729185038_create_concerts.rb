class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.references :band_site
      t.date :date
      t.string :venue
      t.text :details
      t.string :photo_file

      t.timestamps
    end
  end
end
