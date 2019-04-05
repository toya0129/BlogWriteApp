class ArticlesController < ApplicationController
  include ArticlesHelper
  before_action :check_signed_in

  def show
    @article = Article.find(params[:id])
    @new_comment = current_user.comments.new
  end

  def new
    @article = current_user.articles.new
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_perams)
      redirect_to articles_path
    else
      render :edit
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to articles_path
    else
      render :show
    end
  end

  private
    def article_params
        params.require(:article).permit(:title,:contents,:picture,:good)
    end
end
