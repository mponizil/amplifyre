class Album < ActiveRecord::Base
  belongs_to :band_site
  has_many :tracks

  attr_protected
end
