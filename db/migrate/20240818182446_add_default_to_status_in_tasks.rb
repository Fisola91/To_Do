class AddDefaultToStatusInTasks < ActiveRecord::Migration[7.1]
  def change
    change_column_default :tasks, :status, 'doing'
  end
end
