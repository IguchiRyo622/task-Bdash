class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new]
  before_action :setting_team_list
  before_action :setting_task, only: [:show, :edit, :update, :destroy]
  before_action :setting_includes, only: [:index, :show, :edit]

  def index
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
    @user = User.find_by(id: @task.user_id)
    @comment = Comment.new
    @comments = @task.comments.includes(:user)
  end

  def edit
  end

  def update
    if @task.update(task_update)
      redirect_to team_list_task_path(@team, @list, @task)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to root_path
  end

  private

  def task_params
    params.require(:task).permit(:task_name, :content, :target_date, :task_item).merge(user_id: current_user.id)
  end

  def task_update
    params.require(:task).permit(:task_name, :content, :target_date, :report, :final_report, :task_item, :check).merge(user_id: current_user.id)
  end

  def setting_team_list
    @team = Team.find(params[:team_id])
    @list = List.find(params[:list_id])
  end

  def setting_task
    @task = Task.find(params[:id])
  end

  def setting_includes
    @lists = @team.lists.includes(:user)
    @tasks = @list.tasks.includes(:list)
  end
end
