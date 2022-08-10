# frozen_string_literal: true

class TaskBoard < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
end
