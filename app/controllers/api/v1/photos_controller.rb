class Api::V1::PhotosController < ApplicationController
  load_and_authorize_resource :band_site

  # GET /api/v1/band_sites/1/photos/1
  def show
    @photo = @band_site.photos.find(params[:id])

    render json: @photo
  end

  # POST /api/v1/band_sites/1/photos
  def create
    @photo = @band_site.photos.new(params[:photo])

    if @photo.save
      render json: @photo, status: :created
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # PUT /api/v1/band_sites/1/photos/1
  def update
    @photo = @band_site.photos.find(params[:id])

    if @photo.update_attributes(params[:photo])
      render json: @photo
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/band_sites/1/photos/1
  def destroy
    @photo = @band_site.photos.find(params[:id])
    @photo.destroy

    head :no_content
  end
end
