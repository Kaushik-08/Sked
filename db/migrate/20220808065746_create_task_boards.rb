class CreateTaskBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :task_boards do |t|
      t.bigint :user_id
      t.bigint :board_id
      t.string :task

      t.timestamps
    end
  end
end
