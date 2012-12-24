class ApplicationController < ActionController::Base
  protect_from_forgery

  layout 'landing'

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_url(:subdomain => false), :alert => exception.message
  end
end
