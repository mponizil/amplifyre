class ChangeBandSiteBackgroundField < ActiveRecord::Migration
  def up
    remove_column :band_sites, :desat
    remove_column :band_sites, :sat
    add_column :band_sites, :background_file, :string
  end

  def down
    add_column :band_sites, :desat, :string
    add_column :band_sites, :sat, :string
    remove_column :band_sites, :background_file
  end
end
