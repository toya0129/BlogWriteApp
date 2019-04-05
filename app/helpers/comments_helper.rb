module CommentsHelper
  def comment_own?(comment)
    comment.user.id == current_user.id
  end
end
