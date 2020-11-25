class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new]
  before_action :setting_team_list, only: [:index, :new, :create, :show, :edit]

  def index
    @lists = @team.lists.includes(:user)
    @tasks = @list.tasks.includes(:list)
    @task = Task.find_by(params[:task_id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = @list.tasks.new(task_params)
    if @task.save
      redirect_to team_list_tasks_path(@team, @list, @list)
    else
      render :new
    end
  end

  def show
    @lists = @team.lists.includes(:user)
    @tasks = @list.tasks.includes(:list)
    @task = Task.find(params[:id])
    @user = User.find_by(id: @task.user_id)
  end

  def edit
    @lists = @team.lists.includes(:user)
    @tasks = @list.tasks.includes(:list)
    @task = Task.find(params[:id])
  end


  private
  def task_params
    params.require(:task).permit(:task_name, :content, :target_date, :task_item).merge(user_id: current_user.id)
  end

  def setting_team_list
    @team = Team.find(params[:team_id])
    @list = List.find(params[:list_id])
  end
end
