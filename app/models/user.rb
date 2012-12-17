class User < ActiveRecord::Base
  has_and_belongs_to_many :band_sites, :join_table => :band_sites_users

  validates :email, :presence => true

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :band_site_ids, :email, :password, :password_confirmation, :remember_me

  before_validation :set_defaults

  after_create :add_to_mail_chimp

  def to_s
    "#{email}"
  end

  private

  def set_defaults
    self.password ||= Devise.friendly_token.first(6)
  end

  def add_to_mail_chimp
    gb = Gibbon.new
    gb.list_subscribe({:id => '4219443fd7', :email_address => self.email})
  end
end
