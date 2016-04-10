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

  def edit
    @blog = Blog.find_by(id: params[:id])
  end

  def update
    @blog = Blog.find_by(id: params[:id])

    if @blog.update(blog_params)
      redirect_to @blog
    else
      render 'edit'
    end
  end

  def destroy
    @blog = Blog.find_by(id: params[:id])

    if @blog.destroy
      redirect_to '/'
    else
      render 'show'
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :description)
  end

end
