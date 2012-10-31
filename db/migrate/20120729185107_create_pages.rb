class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :band_site
      t.integer :position, :default => 1
      t.string :category, :default => 'custom'
      t.string :slug
      t.string :title, :default => 'New Page'
      t.text :body

      t.timestamps
    end
  end
end
