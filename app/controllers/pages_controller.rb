class PagesController < ApplicationController
  # GET /api/v1/band_sites/1/pages/1
  def show
    @page = Page.find(params[:id])

    render json: @page
  end

  # POST /api/v1/band_sites/1/pages
  def create
    @page = Page.new(params[:page])

    if @page.save
      render json: @page, status: :created, location: @page
    else
      render json: @page.errors, status: :unprocessable_entity
    end
  end

  # PUT /api/v1/band_sites/1/pages/1
  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(params[:page])
      render json: @page
    else
      render json: @page.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/band_sites/1/pages/1
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    head :no_content
  end
end
