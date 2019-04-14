class User::TweetsController < ApplicationController
  before_action :check_signed_in

  def index
    @followers = Follow.where(user_id: session[:user_id])
    @tweets = Tweet.all
    @reply = Tweet.new
  end

  def new
    @tweet = current_user.tweets.new
  end

  def create
    tweet = current_user.tweets.new(tweet_params)
    if tweet.save
      flash[:alert] = "つぶやきを投稿しました"
      redirect_to root_path
    else
      flash.now[:alert] = "つぶやきを投稿できませんでした"
      render :new
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.destroy
      flash[:alert] = "つぶやきを削除しました"
      redirect_to myPage_path
    else
      flash[:alert] = "つぶやきを削除できませんでした"
      redirect_to :root
    end
  end

  private
    def tweet_params
      params.require(:tweet).permit(:contents, :reply_id)
    end
end
