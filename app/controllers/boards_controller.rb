class BoardsController < ApplicationController
  def new
    @bo = Board.all
  end
  def userbord
    @bo = Board.all
    p "========================================="
    p "========================================="
    p "========================================="
    p @bo.first.cover_picture
      
  end
  def create
    # current_user
    @board = Board.new(board_params)
    @board[:user_id] = current_user.id
    # @board.cover_picture.attach(params[:cover_picture])
    if @board.save
      # render plain: "Success"
      redirect_to "/userbord"
    else
      flash[:error] = @board.errors.full_messages.join(",")
      # redirect_to '/boards/new'
      render plain: "failed"
    end
  end

  private 

  def board_params
    params.require(:board).permit(:cover_picture)
  end



end
