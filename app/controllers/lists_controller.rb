class ListsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new]
  before_action :setting_team, only: [:index, :new, :create]

  def index
    @lists = @team.lists.includes(:user)
    @list = List.find_by(params[:list_id])
  end

  def new
    @list = List.new
  end

  def create
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

  def setting_team
    @team = Team.find(params[:team_id])
  end
end
