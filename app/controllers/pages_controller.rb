class PagesController < ApplicationController
  include PagesHelper
  before_action :check_signed_in

  def top_page
    # つぶやきリスト
    @followers = current_user.follows
    @tweets = Tweet.paginate(page: params[:tweet_page], per_page: 10)
    @reply = current_user.tweets.new
    # 最新記事リスト
    @articles = Article.paginate(page: params[:article_page], per_page: 10)
  end

  def my_page
    @article = current_user.articles
    @tweets = current_user.tweets
  end
end
