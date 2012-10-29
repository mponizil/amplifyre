class PhotosController < ApplicationController
  # GET /photos
  def index
    @photos = Photo.all

    render json: @photos
  end

  # GET /photos/1
  def show
    @photo = Photo.find(params[:id])

    render json: @photo
  end

  # GET /photos/new
  def new
    @photo = Photo.new

    render json: @photo
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  def create
    @photo = Photo.new({ :band_site_id => params[:band_site_id], :file => params[:file] })

    if @photo.save
      render json: @photo, status: :created
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # PUT /photos/1
  def update
    @photo = Photo.find(params[:id])

    if @photo.update_attributes(params[:photo])
      render json: @photo
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /photos/1
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    head :no_content
  end
end
