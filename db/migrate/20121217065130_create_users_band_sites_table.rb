class CreateUsersBandSitesTable < ActiveRecord::Migration
  def self.up
    create_table :band_sites_users, :id => false do |t|
        t.references :user
        t.references :band_site
    end
    add_index :band_sites_users, [:user_id, :band_site_id]
    add_index :band_sites_users, [:band_site_id, :user_id]
    remove_column :band_sites, :user_id
  end

  def self.down
    drop_table :band_sites_users
    add_column :band_sites, :user_id
  end
end
