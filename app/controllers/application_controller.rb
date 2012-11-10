class ApplicationController < ActionController::Base
  protect_from_forgery

  layout 'landing'

  before_filter :authenticate

  protected

  def authenticate
    return true if params[:controller] == 'statics' and (params[:action] == 'prelaunch' or params[:action] == 'subscribe')

    authenticate_or_request_with_http_basic do |username, password|
      username == 'mponizil' && password == 'mp8293jd'
    end
  end
end
