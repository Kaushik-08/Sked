class AddUsersToTaskBoards < ActiveRecord::Migration[6.1]
  def change
    add_reference :task_boards , :users , foreign_key:true 
  end
end
