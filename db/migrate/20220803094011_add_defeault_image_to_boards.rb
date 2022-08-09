class AddDefeaultImageToBoards < ActiveRecord::Migration[6.1]
  def change
    add_column :boards, :stage, :string
  end
end
