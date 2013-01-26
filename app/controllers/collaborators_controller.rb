class CollaboratorsController < ApplicationController
  before_filter :get_site_from_slug

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
    @band_site = BandSite.where(:slug => params[:slug])[0]
  end
end
