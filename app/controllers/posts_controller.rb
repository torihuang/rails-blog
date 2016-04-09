class PostsController < ApplicationController
  before_action :get_blog

  def get_blog
    @blog = Blog.find_by(id: params[:id])
  end

  def show
    @post = @blog.posts.find_by(id: params[:post_id])
  end

end
