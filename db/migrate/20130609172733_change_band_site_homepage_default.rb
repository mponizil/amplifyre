class ChangeBandSiteHomepageDefault < ActiveRecord::Migration
  def up
    change_column_default :band_sites, :homepage, 'landing'
  end

  def down
    change_column_default :band_sites, :homepage, 'index'
  end
end
