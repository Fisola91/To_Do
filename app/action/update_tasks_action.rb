class UpdateTasksAction

  def initialize(task_params:, task:)
    @task_params = task_params
    @task = task
  end

  def call
    if task.update(task_params)
      { success: true, task: task }
    else
      { success: false, task: task, errors: task.errors }
    end
  end

  private

    attr_reader :task, :task_params
end
