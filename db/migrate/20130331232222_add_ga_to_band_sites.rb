class AddGaToBandSites < ActiveRecord::Migration
  def change
    add_column :band_sites, :ga, :string, :default => 'UA-36251718-1'
  end
end
