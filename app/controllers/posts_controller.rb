class PostsController < ApplicationController
  before_action :get_blog
  before_action :authorize

  def authorize
    if !current_user
      redirect_to session_new_url
    end
  end

  def get_blog
    @blog = Blog.find_by(id: params[:id])
  end

  def show
    @post = @blog.posts.find_by(id: params[:post_id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.blog_id = params[:blog_id]
    if @post.save
      redirect_to @post.blog
    else
      render action: "new"
    end
  end

  def edit
    @post = Post.find_by(id: params[:post_id])
  end

  def update
    @blog = Blog.find_by(id: params[:id])
    @post = Post.find_by(id: params[:post_id])
    post_params[:blog_id] = @blog.id

    if @post.update(post_params)
      redirect_to [@blog, @post]
    else
      render 'edit'
    end
  end

  def destroy
    @blog = Blog.find_by(id: params[:id])
    @post = Post.find_by(id: params[:post_id])
    if @post.destroy
      redirect_to @blog
    else
      render 'show'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :multiple_tags)
  end

end
