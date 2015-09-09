class TodoTasksController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo_task, except: [:create, :index]

  def create
    @todo_task = @todo_list.todo_tasks.create(todo_task_params)
    redirect_to @todo_list
  end

  def destroy
    @todo_task.destroy
    redirect_to @todo_list
  end

  def index
  end

  private
  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def set_todo_task
    @todo_task = @todo_list.todo_tasks.find(params[:id])
  end

  def todo_task_params
    params.require(:todo_task).permit(:content)
  end

end
