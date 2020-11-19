class ListsController < ApplicationController
  def index
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
      render :new
    end
  end

  private
  def list_params
    params.require(:list).permit(:list).merge(user_id: current_user.id)
  end
end
