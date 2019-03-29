class CommentsController < ApplicationController
  before_action :check

  def create
    @comment = Comment.new(comment_params)
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
    params.require(:comment).permit(:user_id, :article_id, :body)
  end

  def check
    unless login_check
      redirect_to login_path
    end
  end

end
