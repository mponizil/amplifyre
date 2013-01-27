class CollaboratorsController < ApplicationController

  before_filter :get_site_from_slug
  layout 'dashboard'

  # GET /bringtheloot/collaborators
  def index
    authorize! :manage, @band_site
    if @band_site
      @collaborator = User.new
      render
    else
      redirect_to request.protocol + request.domain
    end
  end

  # POST /bringtheloot/collaborators/invite
  def invite
    @collaborator = User.find_by_email(params[:user][:email])

    if @collaborator
      @band_site.user_ids += [@collaborator[:id]]
      flash[:notice] = I18n.t 'collaborator.added', :email => @collaborator.email
      return redirect_to band_site_collaborators_path
    end

    @collaborator = User.invite!(params[:user], current_user)

    if @collaborator.errors.empty?
      @band_site.user_ids += [@collaborator.id]
      flash[:notice] = I18n.t 'devise.invitations.send_instructions', :email => @collaborator.email
    end

    redirect_to band_site_collaborators_path
  end

  # DELETE /bringtheloot/collaborators/1
  def destroy
    authorize! :manage, @band_site
    user = User.find(params[:id])
    @band_site.user_ids -= [params[:id].to_i]
    flash[:notice] = '%s has been removed from the project.' % user[:email]
    redirect_to band_site_collaborators_path
  end

private

  def get_site_from_slug
    @band_site = BandSite.find_by_slug(params[:slug])
    if not @band_site
      redirect_to user_root_path
    end
  end
end
