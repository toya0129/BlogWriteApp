module PagesHelper
  def check_tweet?(tweet,follower)
    tweet.user_id == follower.follow_id || tweet.user_id == current_user.id
  end
end
