class ChangeOldcoloum1ToNewcoloum < ActiveRecord::Migration[6.1]
  def change
    rename_column :task_boards, :member_id , :users_id 
  end
end
