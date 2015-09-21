class TodoListsController < ApplicationController

  before_action :set_todo_list, except: [:index, :create, :new]
  before_action :confirm_logged_in

  def index
    @todo_lists = TodoList.all
  end

  def create
    @todo_list = TodoList.new(todo_list_params)
    if @todo_list.save
      flash[:notice] = 'Todo list created successfully.'
      redirect_to @todo_list
    else
      render('new')
    end
  end

  def update
    if @todo_list.update_attributes(todo_list_params)
      flash[:notice] = 'Todo list updated successfully.'
      redirect_to root_path
    else
      render('edit')
    end
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
    flash[:notice] = 'Todo list destroyed successfully.'
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
