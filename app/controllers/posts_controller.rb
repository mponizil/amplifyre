class PostsController < ApplicationController
  # GET /api/band_sites/1/posts/1
  def show
    @post = Post.find(params[:id])

    render json: @post
  end

  # POST /api/band_sites/1/posts
  def create
    @post = Post.new(params[:post])

    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PUT /api/band_sites/1/posts/1
  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/band_sites/1/posts/1
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    head :no_content
  end
end
