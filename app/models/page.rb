class Page < ActiveRecord::Base
  validates :category, :uniqueness => { :scope => :band_site_id, :message => 'only one of each page category except custom' }, :unless => Proc.new { |p| p.category == 'custom' }
  validates :slug, :uniqueness => { :scope => :band_site_id }

  belongs_to :band_site

  attr_accessible :band_site_id, :created_at, :updated_at, :position, :category, :slug, :title, :body

  before_validation :set_defaults

  private

  def set_defaults
    if Page.where({ :band_site_id => self.band_site_id }).count >= 10
      return false
    end

    last_page = Page.order('position').find_last_by_band_site_id(self.band_site_id)
    if last_page
      self.position = last_page.position + 1
    end

    if self.category == 'custom'
      self.body ||= 'Brand new page'
    end

    self.title ||= self.category.cap_words

    self.slug ||= self.title.parameterize
    self.slug = ensure_unique_slug(self.slug)
  end

  def ensure_unique_slug(slug)
    if Page.where({ :band_site_id => self.band_site_id, :slug => slug }).count > 0
      if (matches = slug.match(/-([\d]+)$/))
        count = matches[1]
        new_count = (count.to_i + 1).to_s
        slug.sub! count, new_count
      else
        slug = slug + '-1'
      end
      slug = ensure_unique_slug(slug)
    end

    return slug
  end
end
