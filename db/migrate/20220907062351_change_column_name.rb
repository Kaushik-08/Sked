class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :task_boards, :fieldname, :alloted
  end
end
