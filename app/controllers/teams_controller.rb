class TeamsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show, :edit, :destroy]
  before_action :setting_team, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
    if current_user.id == @team.team_users[0].user_id
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    if @team.update(update_params)
      redirect_to team_path
    else
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to root_path
  end

  private
  def team_params
    params.require(:team).permit(:team_name, user_ids:[])
  end

  def update_params
    params.require(:team).permit(:team_name, :team_info, user_ids:[])
  end

  def setting_team
    @team = Team.find(params[:id])
  end

end
