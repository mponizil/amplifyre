class UsersController < ApplicationController
  before_filter :authenticate_user!
  layout 'dashboard'

  def dashboard
  end
end
