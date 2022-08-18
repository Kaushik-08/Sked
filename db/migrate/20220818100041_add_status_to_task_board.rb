class AddStatusToTaskBoard < ActiveRecord::Migration[6.1]
  def change
    add_column :task_boards,:status,:string
  end
end
