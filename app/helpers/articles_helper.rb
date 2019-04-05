module ArticlesHelper
  def article_own?(article)
    article.user.id == current_user.id
  end
end
