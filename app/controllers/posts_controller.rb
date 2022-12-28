require "debug"

class PostsController < ApplicationController

  rescue_from Exception do |e|
    render json: { error: e.message }, status: :internal_error 
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def index
    posts = Post.where(published: true)
    render json: posts, status: :ok
  end

  def show
    post = Post.find(params[:id]) rescue nil

    if post.nil? 
      render json: [], status: :not_found 
    else
      render json: post, status: :ok
    end
  end

  def create
    post = Post.create!(create_params)
    render json: post, status: :created
  end

  def update
    postFind = Post.find(params[:id])

    postFind.update!(update_params)
    render json: postFind, status: :ok
  end

  private

  def create_params
    params.require(:post).permit(:title, :content, :published, :user_id)
  end

  def update_params
    params.require(:post).permit(:title, :content, :published)
  end
end
