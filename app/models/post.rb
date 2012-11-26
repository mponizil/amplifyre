class Post < ActiveRecord::Base
  belongs_to :band_site

  attr_accessible :created_at, :updated_at, :band_site_id, :title, :body
end
