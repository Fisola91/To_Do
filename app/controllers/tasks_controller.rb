class TasksController < ApplicationController

  def index
    @tasks = current_user.tasks
  end

  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render "new"
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id].to_i)
    if @task.update(updated_task)
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  private

    def task_params
      params.require(:task).permit(:title, :description, :due_date, :status)
    end

    def status
      task_params.fetch(:status)
    end

    def status_value
      status == "1" ? "completed" : "doing"
    end

    def updated_task
      task_params.merge(status: status_value)
    end
end