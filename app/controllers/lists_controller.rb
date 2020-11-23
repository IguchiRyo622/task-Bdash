class ListsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new]
  before_action :setting_team, only: [:index, :new, :create, :show, :edit, :update]
  before_action :setting_list, only: [:index, :show, :edit]

  def index
    @lists = @team.lists.includes(:user)
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

  def show
  end

  def edit
  end

  def update
    @list = @team.lists.update(list_params)
    redirect_to team_lists_path(@team)
  end

  private
  def list_params
    params.require(:list).permit(:list_name).merge(user_id: current_user.id)
  end

  def setting_team
    @team = Team.find(params[:team_id])
  end

  def setting_list
    @list = List.find_by(params[:list_id])
  end
end
