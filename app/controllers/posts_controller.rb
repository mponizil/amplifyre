class PostsController < ApplicationController
  load_and_authorize_resource :band_site

  # GET /api/v1/band_sites/1/posts/1
  def show
    @post = Post.find(params[:id])

    render json: @post
  end

  # POST /api/v1/band_sites/1/posts
  def create
    @post = Post.new(params)

    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PUT /api/v1/band_sites/1/posts/1
  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/band_sites/1/posts/1
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    head :no_content
  end
end
