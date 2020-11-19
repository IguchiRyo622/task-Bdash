class ListsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new]
  def index
    @team = Team.find(params[:team_id])
    @lists = @team.lists.includes(:user)
  end

  def new
    @list = List.new
    @team = Team.find(params[:team_id])
  end

  def create
    @team = Team.find(params[:team_id])
    @list = @team.lists.new(list_params)
    if @list.save
      redirect_to team_lists_path(@team)
    else
      @lists = @team.lists.includes(:user)
      render :new
    end
  end

  private
  def list_params
    params.require(:list).permit(:list_name).merge(user_id: current_user.id)
  end
end
