class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :band_site
      t.integer :position
      t.string :category, :default => 'custom'
      t.string :slug
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
