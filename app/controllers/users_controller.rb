class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @history = BrowsingTask.all.order(created_at: :desc)
  end

  def search
    @user = User.search(params[:keyword])
  end
end
