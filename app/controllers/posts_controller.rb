class PostsController < ApplicationController
  # GET /posts/1
  def show
    @post = Post.find(params[:id])

    render json: @post
  end

  # POST /posts
  def create
    @post = Post.new(params[:post])

    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PUT /posts/1
  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    head :no_content
  end
end
