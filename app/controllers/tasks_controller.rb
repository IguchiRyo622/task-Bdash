class TasksController < ApplicationController
  def index
    @team = Team.find(params[:team_id])
    @lists = @team.lists.includes(:user)
    @list = List.find_by(params[:list_id])
  end
end
