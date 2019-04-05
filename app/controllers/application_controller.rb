class ApplicationController < ActionController::Base
  include User::SessionHelper

  def follow_check(other_user)
    @follow = Follow.find_by(user_id: session[:user_id], follow_id: other_user.id)
    return @follow.present?
  end

end
