class TodoListsController < ApplicationController

  def index
    @todo_lists = TodoList.all
  end

  def create
    @todo_list = TodoList.new(todo_list_params)
    @todo_list.save
    redirect_to @todo_list
  end

  def new

  end

  def edit

  end

  def show
    @todo_list = TodoList.find(params[:id])
  end

  def destroy

  end

  private
    def todo_list_params
      params.require(:todo_list).permit(:title, :description)
    end

end
