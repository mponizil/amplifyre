class User < ActiveRecord::Base
  has_many :band_sites, :dependent => :destroy

  validates :email, :presence => true

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  after_create :add_to_mail_chimp

  def to_s
    "#{email}"
  end

  private

  def add_to_mail_chimp
    gb = Gibbon.new
    gb.list_subscribe({:id => '02d95d2b31', :email_address => self.email})
  end
end
