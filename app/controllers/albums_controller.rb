class AlbumsController < ApplicationController
  # GET /api/v1/band_sites/1/albums/1
  def show
    @album = Album.find(params[:id])

    render json: @album
  end

  # POST /api/v1/band_sites/1/albums
  def create
    @album = Album.new({ :band_site_id => params[:band_site_id], :cover_file => params[:cover_file] })

    if @album.save
      render json: @album, status: :created
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  # PUT /api/v1/band_sites/1/albums/1
  def update
    @album = Album.find(params[:id])

    if @album.update_attributes(params[:album])
      render json: @album
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  # PUT /api/v1/band_sites/1/albums/reorder
  def reorder
    params[:albums].each do |album|
      if album[:album][:id] > 0
        @album = Album.find(album[:album][:id])
        @album.update_attributes({ :position => album[:position] })
      end
    end

    render json: params[:albums], status: :ok
  end

  # DELETE /api/v1/band_sites/1/albums/1
  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    head :no_content
  end
end
