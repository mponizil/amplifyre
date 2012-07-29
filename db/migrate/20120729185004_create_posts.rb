class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :band_site
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
