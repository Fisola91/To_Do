class User < ApplicationRecord
  # has_many :tasks
  has_many :task_assignments, dependent: :destroy
  has_many :tasks, through: :task_assignments
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:name]
end
