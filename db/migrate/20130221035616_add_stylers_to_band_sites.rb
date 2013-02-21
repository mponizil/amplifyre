class AddStylersToBandSites < ActiveRecord::Migration
  def change
    add_column :band_sites, :skin_color, :string, :default => 'dark'
    add_column :band_sites, :skin_style, :string, :default => 'smooth'
  end
end
