class User::FollowsController < ApplicationController
before_action :check

  def create
    @follow = Follow.new(follow_params)
    if @follow.save
      redirect_to user_path(params[:user_id])
    else
      redirect_to :root
    end
  end

  def destroy
    @follow = Follow.find(params[:id])
    if @follow.destroy
      redirect_to user_path(params[:user_id])
    else
      redirect_to :root
    end
  end

  private
  def follow_params
    params.require(:follow).permit(:follow_id,:user_id)
  end

  def check
    unless login_check
      redirect_to login_path
    end
  end
end
