class CreateUserBords < ActiveRecord::Migration[6.1]
  def change
    create_table :user_bords do |t|
      t.bigint :user_id
      t.bigint :def_img_id

      t.timestamps
    end
  end
end
