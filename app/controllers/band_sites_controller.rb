class BandSitesController < ApplicationController

  before_filter :get_site_from_subdomain
  layout 'dashboard'

  # GET /band_sites/new
  # GET /band_sites/new.json
  def new
    @band_site = BandSite.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @band_site }
    end
  end

  # POST /band_sites
  # POST /band_sites.json
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

  # PUT /band_sites/1
  # PUT /band_sites/1.json
  def update
    @band_site = BandSite.find(params[:id])

    respond_to do |format|
      if @band_site.update_attributes(params[:band_site])
        format.html { redirect_to :action => 'dashboard', :slug => @band_site.slug }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @band_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /band_sites/1
  # DELETE /band_sites/1.json
  def destroy
    @band_site = BandSite.find(params[:id])
    @band_site.destroy

    respond_to do |format|
      format.html { redirect_to user_path }
      format.json { head :no_content }
    end
  end

  def dashboard
    @band_site = BandSite.where(:slug => params[:slug])[0]
  end

  def live
    @slug = request.subdomain
    render :layout => @layout
  end

  def edit_mode
    @slug = request.subdomain
    @version = 'editor'
    render :layout => @layout
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
