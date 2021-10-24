class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user
    if @comment.save
      redirect_to room_post_path(@post, anchor: "comment-#{@comment.id}")
    else
      render "posts/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
