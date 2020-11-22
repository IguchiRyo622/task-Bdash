class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new]
  before_action :setting_team_list, only: [:index, :new, :create]

  def index
    @lists = @team.lists.includes(:user)
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = @list.tasks.new(task_params)
    if @task.save
      redirect_to team_list_tasks_path(@list)
    else
      render :new
    end
  end

  private
  def task_params
    params.require(:task).permit(:task_name, :content, :target_date, :task_item).merge(user_id: current_user.id)
  end

  def setting_team_list
    @team = Team.find(params[:team_id])
    @list = List.find_by(params[:list_id])
  end
end
