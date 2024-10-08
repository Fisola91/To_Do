require "rails_helper"

RSpec.describe UpdateTasksAction do
  let(:current_user) { User.create(email: "ruby@gmail.com", password: "123456", name: "Ruby")}

  let(:task) { Task.create(
      title: "Read a novel",
      description: "The novel is about two friends",
      due_date: Date.new(2024, 10, 15),
      user_id: current_user.id
    )
  }

  let(:task_params) {
    {
      title: "Read a novel",
      description: "The novel is about two friends who fell out",
      due_date: Date.new(2024, 10, 15),
      user_id: current_user.id
    }
  }

  it "updates a task" do
    updated_task = ActionController::Parameters.new(
      described_class.new(task_params:, task:).call
    )

    expect(updated_task["task"]).to have_attributes(title: "Read a novel", description: "The novel is about two friends who fell out")
  end

  context "when due date is absent" do
    let(:invalid_task_params) {
      task_params.merge(due_date: "")
    }

    it "raises error" do
      updated_task = ActionController::Parameters.new(
        described_class.new(task_params: invalid_task_params, task:).call
      )

      expect(updated_task["errors"].full_messages).to include("Due date can't be blank")
    end
  end
end
