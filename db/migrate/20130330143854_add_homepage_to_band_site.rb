class AddHomepageToBandSite < ActiveRecord::Migration
  def change
    add_column :band_sites, :homepage, :string, :default => 'index'
  end
end
