class CommentsController < ApplicationController
  before_action :authorize

  def authorize
    if !current_user
      redirect_to session_new_url
    end
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.post_id = params[:post_id]
    @post = Post.find_by(id: params[:post_id])
    @blog = @post.blog
    if @comment.save
      redirect_to [@blog, @post]
      # redirect_to blog_url(@comment.post.blog)
    else
      redirect_to blog_post_url(@comment.post)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :author_id)
  end
end