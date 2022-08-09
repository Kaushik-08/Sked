class RenameImgId < ActiveRecord::Migration[6.1]
  def change
    rename_column :user_bords, :def_img_id, :img_value
  end
end
