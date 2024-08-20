class User < ApplicationRecord
  # has_many :tasks
  has_many :task_assignments
  has_many :tasks, through: :task_assignments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
