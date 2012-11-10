class User < ActiveRecord::Base
  has_many :band_sites, :dependent => :destroy

  validates :email, :presence => true

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

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
