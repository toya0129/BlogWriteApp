class UserController < ApplicationController
  before_action :check

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @article = Article.where(user_id: params[:id])
    @following = follow_check(@user)
    @tweets = Tweet.where(user_id: params[:id])
    if @following
      @followed = Follow.find_by(user_id: session[:user_id], follow_id: @user.id)
    end
    @follow = Follow.new
  end

  private
  def check
    unless login_check
      redirect_to login_path
    end
  end
end
