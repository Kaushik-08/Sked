# frozen_string_literal: true

class AlterUserBords < ActiveRecord::Migration[6.1]
  def change
    change_column :user_bords, :def_img_id, :bigint
  end
end
