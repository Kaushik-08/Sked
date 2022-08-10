# frozen_string_literal: true

class Board < ApplicationRecord
  belongs_to :user
  has_one_attached :cover_picture
end
