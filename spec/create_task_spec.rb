require "rails_helper"

RSpec.describe CreateTask do
  let(:current_user) { User.create(email: "ruby@gmail.com", password: "123456", name: "Ruby")}
  let(:task_params) {
    {
      title: "See a movie",
      description: "Movie",
      due_date: Date.new(2024, 10, 15),
      user_id: current_user.id
    }
  }

  it "creates a new task" do
    task = ActionController::Parameters.new(
      described_class.new(task_params, current_user).call
    )

    aggregate_failures do
      expect(Task.first.title).to eq("See a movie")
      expect(Task.first.description).to eq("Movie")
      expect(Task.count).to eq(1)
    end
  end
end
