class Post < ActiveRecord::Base
  belongs_to :band_site

  attr_accessible :body, :title
end
