# frozen_string_literal: true

class HomesController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def index
    # render 'homes#index'
    @presence = 0
    current_user
    if current_user != nil
      @presence = 1
    else 
      @presence = 0
    end
  end

  def search
    @search = Post.where('title LIKE ?', "%#{params[:q]}%")
  end
end
