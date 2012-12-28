class CollaboratorsController < ApplicationController
  before_filter :get_site_from_slug

  # GET /bringtheloot/collaborators
  def index
    authorize! :manage, @band_site
    if @band_site
      render
    else
      redirect_to request.protocol + request.domain
    end
  end

  # DELETE /bringtheloot/collaborators/1
  def destroy
    authorize! :manage, @band_site
    @band_site.user_ids -= [params[:id].to_i]
    redirect_to band_site_collaborators_path
  end

private

  def get_site_from_slug
    @band_site = BandSite.where(:slug => params[:slug])[0]
  end
end
