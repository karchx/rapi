require "debug"

class PostsController < ApplicationController
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
end
