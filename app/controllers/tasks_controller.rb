class TasksController < ApplicationController

  def index

  end

  def new
    @task = Task.new
  end

  private

    def task_params
      params.require(:task).permit(:title, :description, :due_date, :status)
    end
end