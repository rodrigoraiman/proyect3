class AdminController < ApplicationController
  def index
  end

  def posts
    @posts = Post.all.includes(:user, :comments)
  end

  def comments
    @post = Post.includes(:user, :comments).find(params[:id])
  end

  def users
  end

  def show_post
    @post = Post.includes(:user, :comments).find(params[:id])
  end
end
