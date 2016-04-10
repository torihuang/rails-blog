class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @post = @comment.post
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