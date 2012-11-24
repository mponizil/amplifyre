class TracksController < ApplicationController
  # GET /api/v1/band_sites/1/tracks/1
  def show
    @track = Track.find(params[:id])

    render json: @track
  end

  # POST /api/v1/band_sites/1/tracks
  def create
    @track = Track.new({ :band_site_id => params[:band_site_id], :album_id => params[:album_id], :file => params[:file] })

    if @track.save
      render json: @track, status: :created
    else
      render json: @track.errors, status: :unprocessable_entity
    end
  end

  # PUT /api/v1/band_sites/1/tracks/1
  def update
    @track = Track.find(params[:id])

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
        @track = Track.find(track[:id])
        @track.update_attributes({ :album_id => track[:album_id], :position => track[:position] })
      end
    end

    render json: params[:tracks], status: :ok
  end

  # DELETE /api/v1/band_sites/1/tracks/1
  def destroy
    @track = Track.find(params[:id])
    @track.destroy

    head :no_content
  end
end
