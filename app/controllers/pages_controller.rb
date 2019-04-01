class PagesController < ApplicationController
  before_action :check_signed_in

  def top_page
    # つぶやきリスト
    @followers = current_user.follows
    @tweets = Tweet.all
    @reply = current_user.tweets.new
    # 最新記事リスト
    @article = Article.all
  end

  def my_page
    @article = current_user.articles
    @tweets = current_user.tweets
  end
end
