class TasksController < ApplicationController
  before_action :find_task, only: %i(show edit update destroy)

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
    unless @task
      flash[:alert] = "Task #{params[:id]} not found."
      redirect_to tasks_path
    end
  end

  def create
    @task = current_user.created_tasks.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

    def task_params
      params.require(:task).permit(:title, :description, :due_date, :status, user_ids: [])
    end

    def find_task
      @task = Task.find(params[:id])
    end
end