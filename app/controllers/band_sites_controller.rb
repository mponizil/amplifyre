class BandSitesController < ApplicationController

  before_filter :get_site_from_slug
  layout 'dashboard'

  # GET /band_sites/new
  def new
    @band_site = BandSite.new
  end

  # POST /band_sites
  def create
    @band_site = BandSite.new(params[:band_site])
    @band_site.user_ids += [current_user.id]
    if @band_site.save
      redirect_to :action => 'dashboard', :slug => @band_site.slug
    else
      render action: 'new'
    end
  end

  # DELETE /bringtheloot
  def destroy
    authorize! :manage, @band_site

    @band_site.destroy

    redirect_to user_root_path
  end

  # GET /bringtheloot/dashboard
  def dashboard
    authorize! :manage, @band_site
    if @band_site
      render
    else
      redirect_to request.protocol + request.domain
    end
  end

  # GET bringtheloot.amplifyre.com
  def live
    if @band_site
      render :layout => @layout
    else
      redirect_to :status => 404
    end
  end

  # GET bringtheloot.amplifyre.com/edit
  def edit_mode
    authorize! :manage, @band_site

    if @band_site
      @version = 'editor'
      render :layout => @layout
    else
      redirect_to request.protocol + request.domain
    end
  end

private

  def get_site_from_slug
    if request.domain.starts_with?('amplifyre')
      @slug = params[:slug] || request.subdomain
    else
      @slug = request.domain.split('.')[0]
    end

    @band_site = BandSite.find_by_slug(@slug)
    @layout = "themes/#{@band_site[:theme]}"
    @version = 'normal'
  end

  def site_layout
    @layout
  end

end
