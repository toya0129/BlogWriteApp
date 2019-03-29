class User::TweetsController < ApplicationController
  before_action :check

  def index
    @followers = Follow.where(user_id: session[:user_id])
    @tweets = Tweet.all
    @reply = Tweet.new
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path
    else
      render :new
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    if @tweet.destroy
      redirect_to myPage_path
    else
      redirect_to :root
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:user_id, :contents, :reply_id)
  end

  def check
    unless login_check
      redirect_to login_path
    end
  end
end
