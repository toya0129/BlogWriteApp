module PagesHelper
  def check_tweet(tweet,follower)
    if tweet.user_id == follower.follow_id
      return true
    elsif tweet.user_id == current_user.id
      return true
    else
      return false
    end
  end
end
