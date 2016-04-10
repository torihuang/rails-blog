class TagsController < ApplicationController
  def show
    @tag = Tag.find_by(id: params[:id])
  end

  def new
    @item = Object.new
    if params[:blog_id]
      @item = Blog.find_by(id: params[:blog_id])
    elsif params[:post_id]
      @item = Post.find_by(id: params[:post_id])
    else
      render 'new'
    end

    @tag = Tag.new
  end

  def create
    @item = Object.new
    @post = Object.new
    @blog = Object.new
    if params[:blog_id]
      @item = Blog.find_by(id: params[:blog_id])
      @blog = @item
    elsif params[:post_id]
      @item = Post.find_by(id: params[:post_id])
      @post = @item
      @blog = @post.blog
    else
      render 'new'
    end

    if @item
      # Checks for uniqueness in tag
      @tag = Tag.new(tag_params)
      @tag = Tag.already_exists(@tag) if Tag.already_exists(@tag)
      @item.tags << @tag
      redirect_to @tag
    else
      render 'new'
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:topic)
  end
end