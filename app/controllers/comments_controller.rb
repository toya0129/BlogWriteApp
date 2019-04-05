class CommentsController < ApplicationController
  include CommentsHelper
  before_action :check_signed_in

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to article_path(params[:article_id])
    else
      redirect_to :root
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to article_path(params[:article_id])
    else
      redirect_to :root
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:article_id, :body)
    end
end
