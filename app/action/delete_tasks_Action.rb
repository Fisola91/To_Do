class DeleteTasksAction

  def initialize(task:)
    @task = task
  end

  def call
    if task.destroy
      { success: true, task: task }
    else
      { success: false, task: task, errors: task.errors }
    end
  end

  private

    attr_reader :task
end