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

  private
  def team_params
    params.require(:team).permit(:team_name, user_ids:[])
  end
end
