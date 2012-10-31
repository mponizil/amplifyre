class Page < ActiveRecord::Base
  belongs_to :band_site

  attr_accessible :band_site_id, :created_at, :updated_at, :position, :category, :slug, :title, :body

  before_create :set_defaults

  private

  def set_defaults
    last_page = Page.order('position').find_last_by_band_site_id(self.band_site_id)
    if last_page
      self.position = last_page.position + 1
    end

    self.slug ||= self.title.parameterize

    if self.category == 'custom'
      self.body ||= 'Brand new page'
    end
  end
end
