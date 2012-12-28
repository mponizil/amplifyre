class ChangeUsersBandSitesToCollaborators < ActiveRecord::Migration
  def up
    rename_table :band_sites_users, :collaborators
  end

  def down
    rename_table :collaborators, :band_sites_users
  end
end
