class Task < ApplicationRecord
  # belongs_to :user
  has_many :task_assignments,  dependent: :destroy
  has_many :users, through: :task_assignments
  has_many :comments, dependent: :destroy

  validates :title , presence: true
  validates :description, presence: true
  validates :due_date, presence: true

  VALID_STATUSES = ['doing', 'completed', 'incompleted']

  validates :status, inclusion: { in: VALID_STATUSES }
end
