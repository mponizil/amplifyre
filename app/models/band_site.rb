class BandSite < ActiveRecord::Base

  belongs_to :user

  attr_accessible :user_id, :name, :description, :phrase, :slug, :title

end
