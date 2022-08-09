class AddValueToBoards < ActiveRecord::Migration[6.1]
  def change
    add_column :boards, :defeault_image, :string
  end
end
