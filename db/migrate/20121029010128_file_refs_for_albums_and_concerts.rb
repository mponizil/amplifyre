class FileRefsForAlbumsAndConcerts < ActiveRecord::Migration
  def up
    remove_column :albums, :cover
    remove_column :concerts, :photo
    add_column :albums, :cover_file, :string
    add_column :concerts, :photo_file, :string
  end

  def down
    add_column :albums, :cover, :string
    add_column :concerts, :photo, :string
    remove_column :albums, :cover_file
    remove_column :concerts, :photo_file
  end
end
