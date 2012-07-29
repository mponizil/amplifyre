class Page < ActiveRecord::Base
  belongs_to :band_site

  attr_accessible :band_site_id, :body, :order, :slug, :title, :type
end
