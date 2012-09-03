class ConcertsController < ApplicationController
  # GET /concerts
  def index
    @concerts = Concert.all

    render json: @concerts
  end

  # GET /concerts/1
  def show
    @concert = Concert.find(params[:id])

    render json: @concert
  end

  # GET /concerts/new
  def new
    @concert = Concert.new

    render json: @concert
  end

  # GET /concerts/1/edit
  def edit
    @concert = Concert.find(params[:id])
  end

  # POST /concerts
  def create
    @concert = Concert.new(params[:concert])

    if @concert.save
      render json: @concert, status: :created, location: @concert
    else
      render json: @concert.errors, status: :unprocessable_entity
    end
  end

  # PUT /concerts/1
  def update
    @concert = Concert.find(params[:id])

    if @concert.update_attributes(params[:concert])
      render json: @concert
    else
      render json: @concert.errors, status: :unprocessable_entity
    end
  end

  # DELETE /concerts/1
  def destroy
    @concert = Concert.find(params[:id])
    @concert.destroy

    head :no_content
  end
end
