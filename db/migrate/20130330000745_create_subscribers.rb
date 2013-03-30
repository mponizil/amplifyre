class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.references :band_site
      t.string :email

      t.timestamps
    end
  end
end
