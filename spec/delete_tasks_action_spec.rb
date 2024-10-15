require "rails_helper"

RSpec.describe DeleteTasksAction do
  let(:current_user) { User.create(email: "ruby@gmail.com", password: "123456", name: "Ruby")}
  let!(:tasks) {
    5.times.map do |i|
      Task.create(
        title: "Task #{i}",
        description: "Description of task #{i}",
        due_date: Date.new(2024, 10, 15),
        user_id: current_user.id
      )
    end
  }


  it "deletes a task" do
    ActionController::Parameters.new(
      described_class.new(task: Task.first).call
    )

    expect(Task.count).to eq(4)
  end
end
