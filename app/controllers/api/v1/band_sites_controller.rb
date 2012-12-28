class Api::V1::BandSitesController < ApplicationController

  # GET /api/v1/band_sites/1
  def show
    @band_site = BandSite.find(params[:id])

    authorize! :manage, @band_site

    render json: @band_site
  end

  # POST /api/v1/band_sites
  def create
    @band_site = BandSite.new(params[:band_site])

    @band_site.user_ids += [current_user.id]

    if @band_site.save
      render json: @band_site, status: :created, location: @band_site
    else
      render json: @band_site.errors, status: :unprocessable_entity
    end
  end

  # PUT /api/v1/band_sites/1
  def update
    @band_site = BandSite.find(params[:id])

    authorize! :manage, @band_site

    if @band_site.update_attributes(params[:band_site])
      render json: @band_site, status: :ok
    else
      render json: @band_site.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/band_sites/1
  def destroy
    @band_site = BandSite.find(params[:id])

    authorize! :manage, @band_site

    @band_site.destroy

    head :no_content
  end

end
