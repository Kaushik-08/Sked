# frozen_string_literal: true

class HomesController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def index
    # render 'homes#index'
  end

  def search
    @search = Post.where('title LIKE ?', "%#{params[:q]}%")
  end
end
