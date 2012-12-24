class ApplicationController < ActionController::Base
  protect_from_forgery

  layout 'landing'

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to new_user_session_url(:subdomain => false), :alert => exception.message }
      format.json { render :json => {
        :error => {
          code: 403,
          message: exception.message
        }
      }, :status => :forbidden }
    end
  end
end
