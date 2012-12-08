class BandSitesController < ApplicationController

  before_filter :get_site_from_subdomain
  layout 'dashboard'


  # GET /band_sites/new
  def new
    @band_site = BandSite.new
  end

  # GET /bringtheloot/dashboard
  def dashboard
    @band_site = BandSite.where(:slug => params[:slug])[0]

    if @band_site
      render
    else
      redirect_to request.protocol + request.domain
    end
  end

  # GET bringtheloot.amplifyre.com
  def live
    @slug = request.subdomain
    @band_site = BandSite.where(:slug => @slug)[0]

    if @band_site
      render :layout => @layout
    else
      redirect_to :status => 404
    end
  end

  # GET bringtheloot.amplifyre.com/edit
  def edit_mode
    @slug = request.subdomain
    @band_site = BandSite.where(:slug => @slug)[0]

    if @band_site
      @version = 'editor'
      render :layout => @layout
    else
      redirect_to request.protocol + request.domain
    end
  end


  # GET /api/v1/band_sites/1
  def show
    @band_site = BandSite.find(params[:id])

    render json: @band_site
  end

  # POST /api/v1/band_sites
  def create
    @band_site = BandSite.new(params[:band_site])

    @band_site.user_id = current_user.id

    respond_to do |format|
      if @band_site.save
        format.html { redirect_to :action => 'dashboard', :slug => @band_site.slug }
        format.json { render json: @band_site, status: :created, location: @band_site }
      else
        format.html { render action: 'new' }
        format.json { render json: @band_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /api/v1/band_sites/1
  def update
    @band_site = BandSite.find(params[:id])

    respond_to do |format|
      if @band_site.update_attributes(params)
        format.html { redirect_to :action => 'dashboard', :slug => @band_site.slug }
        format.json { render json: @band_site, status: :ok }
      else
        format.html { render action: 'edit' }
        format.json { render json: @band_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/band_sites/1
  def destroy
    @band_site = BandSite.find(params[:id])
    @band_site.destroy

    respond_to do |format|
      format.html { redirect_to user_root_path }
      format.json { head :no_content }
    end
  end


  private

  def get_site_from_subdomain
    @layout = 'press-play'
    @version = 'normal'
  end

  def site_layout
    @layout
  end

end
