class ConcertsController < ApplicationController
  # GET /api/v1/band_sites/1/concerts/1
  def show
    @concert = Concert.find(params[:id])

    render json: @concert
  end

  # POST /api/v1/band_sites/1/concerts
  def create
    params[:concert][:band_site_id] = params[:band_site_id]
    @concert = Concert.new(params[:concert])

    if @concert.save
      render json: @concert, status: :created
    else
      render json: @concert.errors, status: :unprocessable_entity
    end
  end

  # PUT /api/v1/band_sites/1/concerts/1
  def update
    @concert = Concert.find(params[:id])

    if @concert.update_attributes(params[:concert])
      render json: @concert
    else
      render json: @concert.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/band_sites/1/concerts/1
  def destroy
    @concert = Concert.find(params[:id])
    @concert.destroy

    head :no_content
  end
end
