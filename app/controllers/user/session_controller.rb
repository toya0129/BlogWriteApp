class User::SessionController < ApplicationController
  before_action :check_signed_in_ToRoot, only: [:new,:create]

  def new
    @session = User.new
  end

  def create
    user = User.find_by(name: :name)
    if user.authenticate(:password)
      flash[:alert] = "ログインに成功しました"
      sign_in(user)
      redirect_to :root
    else
      flash[:alert] = "ログインに失敗しました"
      render :new
    end
  end

  def destroy
    sign_out
    flash[:alert] = "ログアウトしました"
    redirect_to :root
  end

  private
    def session_params
      params.require(:user).permit(:name, :password)
    end
end
