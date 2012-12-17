class BandSite < ActiveRecord::Base

  has_and_belongs_to_many :user, :join_table => :band_sites_users
  has_many :pages, :dependent => :destroy
  has_many :albums, :dependent => :destroy
  has_many :tracks, :dependent => :destroy
  has_many :concerts, :dependent => :destroy
  has_many :photos, :dependent => :destroy
  has_many :posts, :dependent => :destroy
  has_many :socials, :dependent => :destroy

  validates :name, :presence => true

  attr_accessible :id, :user_ids, :created_at, :updated_at, :user_id, :slug, :name, :description, :title, :phrase, :background_file

  mount_uploader :background_file, BackgroundUploader

  before_validation :set_defaults
  after_create :create_association_defaults

  private

  def set_defaults
    self.slug ||= self.name.parameterize
    self.title ||= self.name
    self.phrase ||= 'amplifyre | press play'
  end

  def create_association_defaults
    self.pages.create({ :category => 'custom', :slug => 'about', :title => 'About', :body => 'Thanks for checking out Amplifyre.' })
    self.pages.create({ :category => 'listen', :slug => 'tracks', :title => 'Tracks' })
    self.pages.create({ :category => 'contact', :slug => 'contact', :title => 'Contact' })
    self.tracks.create()
  end

end
