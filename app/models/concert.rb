class Concert < ActiveRecord::Base
  belongs_to :band_site

  attr_accessible :band_site_id, :created_at, :updated_at, :date, :venue, :details, :photo
end
