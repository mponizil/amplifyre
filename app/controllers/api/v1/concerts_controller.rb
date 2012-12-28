class Api::V1::ConcertsController < ApplicationController
  load_and_authorize_resource :band_site

  # GET /api/v1/band_sites/1/concerts/1
  def show
    @concert = @band_site.concerts.find(params[:id])

    render json: @concert
  end

  # POST /api/v1/band_sites/1/concerts
  def create
    @concert = @band_site.concerts.new(params[:concert])

    if @concert.save
      render json: @concert, status: :created
    else
      render json: @concert.errors, status: :unprocessable_entity
    end
  end

  # PUT /api/v1/band_sites/1/concerts/1
  def update
    @concert = @band_site.concerts.find(params[:id])

    if @concert.update_attributes(params[:concert])
      render json: @concert
    else
      render json: @concert.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/band_sites/1/concerts/1
  def destroy
    @concert = @band_site.concerts.find(params[:id])
    @concert.destroy

    head :no_content
  end
end
