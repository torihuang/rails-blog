class BlogsController < ApplicationController
  def index
    @blogs = Blog.all.to_a
  end

  def show
    @blog = Blog.find_by(id: params[:id])
    @posts = @blog.posts
  end
end
