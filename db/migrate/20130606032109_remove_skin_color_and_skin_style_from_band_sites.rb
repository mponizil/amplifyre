class RemoveSkinColorAndSkinStyleFromBandSites < ActiveRecord::Migration
  def change
    remove_column :band_sites, :skin_color
    remove_column :band_sites, :skin_style
  end
end
