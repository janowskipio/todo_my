class TodoTasksController < ApplicationController

  before_action :get_todo_list
  before_action :get_todo_task, except: [:create, :index]
  before_action :confirm_logged_in

  def create
    @todo_task = @todo_list.todo_tasks.new(todo_task_params)
    if @todo_task.save
      flash[:notice] = 'Todo task created successfully.'
    else
      flash[:notice] = @todo_task.errors.full_messages.first
    end
    redirect_to(@todo_list)
  end

  def destroy
    @todo_task.destroy
    flash[:notice] = 'Todo task destroyed successfully.'
    redirect_to(@todo_list)
  end

  def index
    @todo_tasks = @todo_list.todo_tasks
    @todo_task = TodoTask.new
  end

  def edit
  end

  def update
    if @todo_task.update_attributes(todo_task_params)
      flash[:notice] = 'Todo task updated successfully.'
      redirect_to(@todo_list)
    else
      render('edit')
    end
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
