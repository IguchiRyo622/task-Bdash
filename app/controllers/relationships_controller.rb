class RelationshipsController < ApplicationController
  before_action :set_user

  def follow
    current_user.follow(params[:id])
    redirect_to user_path(@user)
  end

  def unfollow
    current_user.unfollow(params[:id])
    redirect_to user_path(@user)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
