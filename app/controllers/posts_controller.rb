class PostsController < ApplicationController
  include ApplicationHelper
  before_action :get_blog

  def get_blog
    @blog = Blog.find_by(id: params[:id])
  end

  def show
    @post = @blog.posts.find_by(id: params[:post_id])
  end

  def new
    @post = Post.new
  end

  def create
    # puts @blog
    # @blog = Blog.find_by(id: params[:id])
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post.blog
    else
      render action: "new"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :blog_id)
  end

end
