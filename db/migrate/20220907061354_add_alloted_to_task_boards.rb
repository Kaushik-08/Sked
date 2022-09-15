class AddAllotedToTaskBoards < ActiveRecord::Migration[6.1]
  def change
    add_column :task_boards, :fieldname, :string
  end
end
