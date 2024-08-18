class Task < ApplicationRecord
  belongs_to :user

  validates :title , presence: true
  validates :description, presence: true

  VALID_STATUSES = ['doing', 'completed', 'incompleted']

  validates :status, inclusion: { in: VALID_STATUSES }
end
