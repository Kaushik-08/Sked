class ChangeDatatypeForDefaultImage < ActiveRecord::Migration[6.1]
  def change
    change_column(:d_images, :default_image, :binary)
  end
end
