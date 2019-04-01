module User::SessionHelper
  def check_signed_in
    unless login_check
      redirect_to login_path
    end
  end

  def login_check
    session[:user_id].present?
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] = nil
  end

  def current_user
    User.find(session[:user_id])
  end
end
