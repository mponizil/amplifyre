class Api::V1::TracksController < ApplicationController
  load_and_authorize_resource :band_site

  # GET /api/v1/band_sites/1/tracks/1
  def show
    @track = @band_site.tracks.find(params[:id])

    render json: @track
  end

  # POST /api/v1/band_sites/1/tracks
  def create
    @track = @band_site.tracks.new(params[:track])

    if @track.save
      render json: @track, status: :created
    else
      render json: @track.errors, status: :unprocessable_entity
    end
  end

  # PUT /api/v1/band_sites/1/tracks/1
  def update
    @track = @band_site.tracks.find(params[:id])

    if @track.update_attributes(params[:track])
      render json: @track
    else
      render json: @track.errors, status: :unprocessable_entity
    end
  end

  # PUT /api/v1/band_sites/1/tracks/reorder
  def reorder
    params[:tracks].each do |track|
      if track[:id] > 0
        @track = @band_site.tracks.find(track[:id])
        @track.update_attributes({ :album_id => track[:album_id], :position => track[:position] })
      end
    end

    render json: params[:tracks], status: :ok
  end

  # DELETE /api/v1/band_sites/1/tracks/1
  def destroy
    @track = @band_site.tracks.find(params[:id])
    @track.destroy

    head :no_content
  end
end
