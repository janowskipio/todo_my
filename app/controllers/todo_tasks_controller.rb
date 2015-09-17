class TodoTasksController < ApplicationController
  before_action :get_todo_list
  before_action :get_todo_task, except: [:create, :index]

  def create
    @todo_task = @todo_list.todo_tasks.new(todo_task_params)
    @todo_task.save
    redirect_to @todo_list
  end

  def destroy
    @todo_task.destroy
    redirect_to @todo_list
  end

  def index
    @todo_tasks = @todo_list.todo_tasks
    @todo_task = TodoTask.new
  end

  def edit
  end

  def update
    @todo_task.update_attributes(todo_task_params)
    redirect_to(@todo_list)
  end

  private

  def get_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def get_todo_task
    @todo_task = @todo_list.todo_tasks.find(params[:id])
  end

  def todo_task_params
    params.require(:todo_task).permit(:content)
  end

end
