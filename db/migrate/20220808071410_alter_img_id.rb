class AlterImgId < ActiveRecord::Migration[6.1]
  def change
    change_column :user_bords, :def_img_id, :string
  end
end
