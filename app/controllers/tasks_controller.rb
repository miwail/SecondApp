class TasksController < ApplicationController
  before_action :find_task, only: [:show, :update, :edit, :destroy ]
  before_action :check_user?, only: [:update, :destroy]

  def index
    @tasks = current_user.tasks.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      flash[:notice] = 'Task successfull add'
      redirect_to user_tasks_path
    else
      flash.now[:alert] = @task.errors.full_messages
      render "new"
    end
  end

  def update
    if @task.update(task_params)
      flash[:notice] = 'Task successfull edit'
      redirect_to root_url
    else
      flash.now[:alert] = 'Oops, something going wrong'
      render "edit"
    end
  end

  def edit
  end

  def destroy
    @task.destroy
    flash[:notice] = 'Tasks successfull deleted'
    redirect_to root_url
  end

  def check_user?
    unless @task.user == current_user
      flash[:alert] = 'You dont have permission to do this!!'
      redirect_to root_url
    end
  end

  def find_task
    @task = Task.find(params[:id])
  end

  private
    def task_params
      params.require(:task).permit(:title, :description, :complated)
    end
end
