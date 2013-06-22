class ChangeBandSiteHomepageDefaultAgain < ActiveRecord::Migration
  def up
    change_column_default :band_sites, :homepage, 'default'
  end

  def down
    change_column_default :band_sites, :homepage, 'landing'
  end
end
