class User::RegistrationController < ApplicationController
  before_action :logged_in_to_root, only: [:new,:create]

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      flash[:alert] = "アカウント作成に成功しました"
      sign_in(user)
      redirect_to :root
    else
      flash.now[:alert] = "アカウント作成に失敗しました"
      render :new
    end
  end

  def destroy
    user = User.find(session[:user_id])
    if user.destroy
      flash[:alert] = "アカウントの削除に成功しました"
      redirect_to 'new'
    else
      flash.now[:alert] = "アカウントの削除に失敗しました"
      render :root
    end
  end

  private
    def user_params
      params.require(:user).permit(:name,:password,:password_confirm)
    end
end
