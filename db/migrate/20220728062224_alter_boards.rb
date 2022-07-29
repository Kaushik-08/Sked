class AlterBoards < ActiveRecord::Migration[6.1]
  def change
    change_column(:boards, :cover_picture, :string)
  end
end
