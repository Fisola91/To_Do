class CreateTasksAction
  include Pundit::Authorization

  def initialize(params, current_user)
    @params = params
    @current_user = current_user
  end

  def call
    task = current_user.created_tasks.new(params)
    authorize(task, :create?)

    if task.save
      { success: true, task: task }
    else
      { success: false, task: task, errors: task.errors }
    end
  end

  private

    attr_reader :current_user, :params
end
