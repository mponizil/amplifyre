class AddDescriptionToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :description, :string
  end
end
