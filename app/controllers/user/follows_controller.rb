class User::FollowsController < ApplicationController
  before_action :check_signed_in

  def create
    @follow = Follow.new(follow_params)
    if @follow.save
      flash[:alert] = "フォローしました"
      redirect_to user_path(params[:user_id])
    else
      flash[:alert] = "フォローできませんでした"
      redirect_to :root
    end
  end

  def destroy
    follow = Follow.find(params[:id])
    if follow.destroy
      flash[:alert] = "フォロー解除しました"
      redirect_to user_path(params[:user_id])
    else
      flash[:alert] = "フォロー解除できませんでした"
      redirect_to :root
    end
  end

  private
    def follow_params
      params.require(:follow).permit(:follower_id,:following_id)
    end
end
