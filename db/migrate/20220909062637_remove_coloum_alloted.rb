class RemoveColoumAlloted < ActiveRecord::Migration[6.1]
  def change
    remove_column :task_boards, :alloted
  end
end
