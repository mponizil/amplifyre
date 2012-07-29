class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :band_site
      t.integer :order
      t.string :type
      t.string :slug
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
