class ChangeOldcoloumToNewcoloum < ActiveRecord::Migration[6.1]
  def change
    rename_column :task_boards, :users_id, :member_id
  end
end
