class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @link = Link.find(params[:link_id])
    @comment = @link.comments.build(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to link_path(@link)
  end

  def destroy
    @link = Link.find(params[:link_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:alert] = "Comment was successfully destroyed."
    redirect_to link_path(@link)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end