class AddThemeToBandSites < ActiveRecord::Migration
  def change
    add_column :band_sites, :theme, :string, :default => 'press-play'
  end
end
