class PagesController < ApplicationController
  # GET /api/v1/band_sites/1/pages/1
  def show
    @page = Page.find(params[:id])

    render json: @page
  end

  # POST /api/v1/band_sites/1/pages
  def create
    params[:page][:band_site_id] = params[:band_site_id]
    @page = Page.new(params[:page])

    if @page.save
      render json: @page, status: :created
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

  # PUT /api/v1/band_sites/1/pages/reorder
  def reorder
    params[:pages].each do |page|
      @page = Page.find(page[:id])
      @page.update_attributes({ :position => page[:position] })
    end

    render json: params[:pages], status: :ok
  end

  # DELETE /api/v1/band_sites/1/pages/1
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    head :no_content
  end
end
