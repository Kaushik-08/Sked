# frozen_string_literal: true

class CreateDImages < ActiveRecord::Migration[6.1]
  def change
    create_table :d_images do |t|
      t.string :default_image
      t.string :value

      t.timestamps
    end
  end
end
