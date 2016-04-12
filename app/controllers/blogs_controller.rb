class BlogsController < ApplicationController

  def authorize
    if !current_user
      redirect_to session_new_url
    end
  end

  def index
    @blogs = Blog.all.to_a
  end

  def show
    self.authorize
    @blog = Blog.find_by(id: params[:id])
    @posts = @blog.posts
  end

  def new
    self.authorize
    @blog = Blog.new
  end

  def create
    self.authorize
    @blog = Blog.new(blog_params)
    @blog.author = current_user

    if @blog.save
      redirect_to @blog
    else
      render action: "new"
    end
  end

  def edit
    self.authorize
    @blog = Blog.find_by(id: params[:id])
  end

  def update
    self.authorize
    @blog = Blog.find_by(id: params[:id])

    if @blog.update(blog_params)
      redirect_to @blog
    else
      render 'edit'
    end
  end

  def destroy
    self.authorize
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
