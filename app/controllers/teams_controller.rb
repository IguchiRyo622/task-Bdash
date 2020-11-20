class TeamsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(update_params)
      redirect_to team_path
    else
      render :edit
    end
  end


  private
  def team_params
    params.require(:team).permit(:team_name, user_ids:[])
  end

  def update_params
    params.require(:team).permit(:team_name, :team_info, user_ids:[])
  end
end
