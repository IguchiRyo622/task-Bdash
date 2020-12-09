class ItemsController < ApplicationController
  before_action :set_task
  
  def create
    Item.create(item_params)
    redirect_to team_list_task_path(@team, @list, @task)
  end

  def checked
    item = Item.find(params[:id])
    if item.check
      item.update(check: false)
    else
      item.update(check: true)
    end

    item = Item.find(params[:id])
    render json: { item: item}
  end
  
  private
  
  def item_params
    params.require(:item).permit(:task_item, :check).merge(user_id: current_user.id, task_id: params[:task_id])
  end
  
  def set_task
    @team = Team.find(params[:team_id])
    @list = List.find(params[:list_id])
    @task = Task.find(params[:task_id])
  end
end
