class PagesController < ApplicationController
  # GET /pages
  def index
    @pages = Page.all

    render json: @pages
  end

  # GET /pages/1
  def show
    @page = Page.find(params[:id])

    render json: @page
  end

  # GET /pages/new
  def new
    @page = Page.new

    render json: @page
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  def create
    @page = Page.new(params[:page])

    if @page.save
      render json: @page, status: :created, location: @page
    else
      render json: @page.errors, status: :unprocessable_entity
    end
  end

  # PUT /pages/1
  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(params[:page])
      render json: @page
    else
      render json: @page.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pages/1
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    head :no_content
  end
end
