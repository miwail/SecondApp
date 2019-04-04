class TasksController < ApplicationController


  def index
    @tasks = current_user.tasks.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)

    if @task.save
      flash[:notice] = "Task successfull add"
      redirect_to user_tasks_path
    else
      flash.now[:alert] = "Oops, something going wrong"
      render "new"
    end
  end

  def update
    @task = Task.find(params[:id])
    if chek_user?
      if @task.update(task_params)
        flash[:notice] = "Task successfull edit"
        redirect_to root_url
      else
        flash.now[:alert] = "Oops, something going wrong"
        render "edit"
      end
    else
      flash[:alert] = "You dont have permission to do this!!"
      redirect_to root_url
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    if chek_user?
      @task.destroy
      flash[:notice] = "Tasks successfull deleted"
      redirect_to root_url
    else
      flash[:alert] = "You dont have permission to do this!!"
      redirect_to root_url
    end
  end

  def chek_user?
    @task.user == current_user
  end

  private
    def task_params
      params.require(:task).permit(:title, :description, :complated)
    end
end
