class TasksController < ApplicationController

  def index
    @tasks = current_user.tasks
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render "new"
    end
  end

  private

    def task_params
      params.require(:task).permit(:title, :description, :due_date, :status)
    end
end