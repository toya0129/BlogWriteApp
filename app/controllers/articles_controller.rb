class ArticlesController < ApplicationController
  before_action :check

  def show
    @article = Article.find(params[:id])
    @comment = Comment.includes(:user).where(article_id: params[:id])
    @new_comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_perams)
    @article.user_id = session[:user_id]
    if @article.save
      redirect_to articles_path
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
  def article_perams
      params.require(:article).permit(:user_id,:title,:contents,:picture,:good)
  end

  def check
    unless login_check
      redirect_to login_path
    end
  end

end
