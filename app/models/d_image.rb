# frozen_string_literal: true

class DImage < ApplicationRecord
  has_one_attached :default_image
end
