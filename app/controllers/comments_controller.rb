class CommentsController < ApplicationController
  before_action :set_task

  def create
    Comment.create(comment_params)
    redirect_to team_list_task_path(@team, @list, @task)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, task_id: params[:task_id])
  end

  def set_task
    @team = Team.find(params[:team_id])
    @list = List.find(params[:list_id])
    @task = Task.find(params[:task_id])
  end
end
