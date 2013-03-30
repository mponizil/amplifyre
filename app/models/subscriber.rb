class Subscriber < ActiveRecord::Base
  belongs_to :band_site
  attr_accessible :email

  def to_s
    email
  end
end
