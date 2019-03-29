class ApplicationController < ActionController::Base
  def login_check
    if session[:user_id] != nil
      return true
    else
      return false
    end
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] = nil
  end

  def follow_check(other_user)
    @follow = Follow.find_by(user_id: session[:user_id], follow_id: other_user.id)
    unless @follow == nil
      return true
    else
      return false
    end
  end

end
