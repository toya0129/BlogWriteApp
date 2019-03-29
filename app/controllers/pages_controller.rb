class PagesController < ApplicationController
  before_action :check

  def topPage
    # つぶやきリスト
    @followers = Follow.where(user_id: session[:user_id])
    @tweets = Tweet.all
    @reply = Tweet.new
    # 最新記事リスト
    @article = Article.all
  end

  def myPage
    @article = Article.where(user_id: session[:user_id])
    @tweets = Tweet.where(user_id: session[:user_id])
  end

  private
  def check
    unless login_check
      redirect_to sign_up_path
    end
  end
end
