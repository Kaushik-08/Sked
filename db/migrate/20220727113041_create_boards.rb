# frozen_string_literal: true

class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.binary :cover_picture
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
