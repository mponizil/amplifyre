class Page < ActiveRecord::Base
  validates :category, :uniqueness => { :scope => :band_site_id, :message => 'only one of each page category except custom' }, :unless => Proc.new { |p| p.category == 'custom' }

  belongs_to :band_site

  attr_accessible :band_site_id, :created_at, :updated_at, :position, :category, :slug, :title, :body

  before_validation :set_defaults

  private

  def set_defaults
    last_page = Page.order('position').find_last_by_band_site_id(self.band_site_id)
    if last_page
      self.position = last_page.position + 1
    end

    self.title ||= self.category.cap_words
    self.slug ||= self.title.parameterize

    if self.category == 'custom'
      self.body ||= 'Brand new page'
    end
  end
end
