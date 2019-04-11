class ArticlesController < ApplicationController
  include ArticlesHelper
  before_action :check_signed_in
  helper_method :article

  def show
    @new_comment = current_user.comments.new
  end

  def new
    @article = current_user.articles.new
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      flash[:alert] = "記事の保存に成功しました"
      redirect_to root_path
    else
      flash[:alert] = "記事の保存に失敗しました"
      render :new
    end
  end

  def update
    if article.update(article_params)
      flash[:alert] = "記事の編集に成功しました"
      redirect_to root_path
    else
      flash[:alert] = "記事の編集に失敗しました"
      render :edit
    end
  end

  def edit

  end

  def destroy
    if article.destroy
      flash[:alert] = "記事の削除に成功しました"
      redirect_to root_path
    else
      flash[:alert] = "記事の削除に失敗しました"
      render :show
    end
  end

  private
    def article_params
        params.require(:article).permit(:title,:contents,:picture,:good)
    end

    def article
      @article ||= Article.find(params[:id])
    end
end
