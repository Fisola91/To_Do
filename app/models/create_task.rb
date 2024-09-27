class CreateTask

  def initialize(params, current_user)
    @params = params
    @current_user = current_user
  end

  def call
    task = current_user.created_tasks.new(params)

    if task.save
      { success: true, task: task }
    else
      { success: false, task: task, errors: task.errors }
    end
  end

  private

    attr_reader :current_user, :params
end
