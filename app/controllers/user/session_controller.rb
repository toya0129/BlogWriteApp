class User::SessionController < ApplicationController
  before_action :check, only: [:new,:create]

  def new
    @session = User.new
  end

  def create
    if @user.authenticate(session_params[:password])
      sign_in(user)
      redirect_to :root
    else
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to :root
  end

  private
  def session_params
      params.require(:session).permit(:name, :password)
  end

  def check
    if login_check
      redirect_to :root
    end
  end
end
