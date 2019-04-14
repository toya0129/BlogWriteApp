class UserController < ApplicationController
  before_action :check_signed_in

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @article = Article.where(user_id: params[:id])
    @tweets = Tweet.where(user_id: params[:id])
    if @following = follow_check(@user)
      @followed = Follow.find_by(following_id: session[:user_id], follower_id: @user.id)
    end
    @follow = Follow.new
  end
end
