class BlogsController < ApplicationController
  include ApplicationHelper
  def index
    @blogs = Blog.all.to_a
  end

  def show
    @blog = Blog.find_by(id: params[:id])
    @posts = @blog.posts
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.author = current_user
    print blog_params
    if @blog.save
      redirect_to @blog
    else
      render action: "new"
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :description)
  end

end
