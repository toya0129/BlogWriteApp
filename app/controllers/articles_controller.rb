class ArticlesController < ApplicationController
  before_action :check_signed_in

  def show
    @article = Article.find(params[:id])
    @new_comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = session[:user_id]
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
        params.require(:article).permit(:user_id,:title,:contents,:picture,:good)
    end
end
