class AlbumsController < ApplicationController
  load_and_authorize_resource :band_site

  # GET /api/v1/band_sites/1/albums/1
  def show
    @album = @band_site.albums.find(params[:id])

    render json: @album
  end

  # POST /api/v1/band_sites/1/albums
  def create
    @album = @band_site.albums.new(params[:album])

    if @album.save
      render json: @album, status: :created
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  # PUT /api/v1/band_sites/1/albums/1
  def update
    @album = @band_site.albums.find(params[:id])

    if @album.update_attributes(params[:album])
      render json: @album
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  # PUT /api/v1/band_sites/1/albums/reorder
  def reorder
    params[:albums].each do |album|
      if album[:id] > 0
        @album = @band_site.albums.find(album[:id])
        @album.update_attributes({ :position => album[:position] })
      end
    end

    render json: params[:albums], status: :ok
  end

  # DELETE /api/v1/band_sites/1/albums/1
  def destroy
    @album = @band_site.albums.find(params[:id])
    @album.destroy

    head :no_content
  end
end
