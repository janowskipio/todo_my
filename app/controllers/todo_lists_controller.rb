class TodoListsController < ApplicationController
  before_action :set_todo_list, only: [:show, :edit, :update, :destroy]

  def index
    @todo_lists = TodoList.all
  end

  def create
    @todo_list = TodoList.new(todo_list_params)
    @todo_list.save
    redirect_to @todo_list
  end

  def update
    @todo_list.update(todo_list_params)
    redirect_to root_path
  end

  def new
    @todo_list = TodoList.new
  end

  def edit
  end

  def show
    redirect_to todo_list_todo_tasks_path(@todo_list)
  end

  def destroy
    @todo_list.destroy
    redirect_to root_path
  end

  private
    def set_todo_list
      @todo_list = TodoList.find(params[:id])
    end

    def todo_list_params
      params.require(:todo_list).permit(:title, :description)
    end

end
