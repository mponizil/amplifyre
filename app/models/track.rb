class Track < ActiveRecord::Base
  belongs_to :album

  attr_protected
end
