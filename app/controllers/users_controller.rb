class UsersController < ApplicationController
    skip_before_action :ensure_user_logged_in
    
    def new
    end
    def create
        user = User.new(user_params)
        if user.save
          redirect_to root_path
        else
          flash[:error] = user.errors.full_messages.join(",")
          redirect_to '/users/new'
          # render plain: "filed"
        end
      end

      private
      def user_params
        params.require(:user).permit(:name, :email, :password)
      end
end
