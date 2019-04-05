class User::RegistrationController < ApplicationController
  before_action :check_signed_in_ToRoot, only: [:new,:create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
      redirect_to :root
    else
      render :new
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    if @user.destroy
      redirect_to 'new'
    else
      render :root
    end
  end

  private
    def user_params
      params.require(:user).permit(:name,:password,:password_confirm)
    end
end
