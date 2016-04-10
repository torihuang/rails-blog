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
    if params[:blog_id]
      @item = Blog.find_by(id: params[:blog_id])
    elsif params[:post_id]
      @item = Post.find_by(id: params[:post_id])
    else
      render 'new'
    end

    if @item
      @tag = @item.tags.create(tag_params)
    else
      render 'new'
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:topic)
  end
end