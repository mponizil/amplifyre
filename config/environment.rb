# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Amplifyre::Application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address  => "smtp.gmail.com",
  :port  => 587,
  :user_name  => "roadie@amplifyre.com",
  :password  => APP_CONFIG['gmail_roadie_password'],
  :authentication  => :plain
}

Rails.logger = Logger.new(STDOUT)
