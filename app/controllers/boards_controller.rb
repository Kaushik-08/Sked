
class BoardsController < ApplicationController
  def new
    @bo = Board.all
  end

  def userbord
    @d_image = DImage.all
    @bo = Board.all
    p '========================================='
    p '========================================='
    p '========================================='
    p @bo.first.cover_picture
  end
  
  def create
    # current_user
    @board = Board.new(board_params)
    @board[:user_id] = current_user.id
    # @board.cover_picture.attach(params[:cover_picture])
    if @board.save
      # render plain: "Success"
      redirect_to '/userbord'
    else
      flash[:error] = @board.errors.full_messages.join(',')
      # redirect_to '/boards/new'
      render plain: 'failed'
    end

  end

  def destroy
    TaskBoard.find(params[:id]).destroy
    redirect_to request.referrer
  end

  def new_background
    # @d_image = DImage.find_by_value(params[:bg])
    # redirect_to "/background/#{board.id}"
    bord = UserBord.create(img_value: params[:bg], user_id: @current_user.id)
    redirect_to "/background/#{bord.id}"
  end

  def background
    @in_progress = TaskBoard.where(status: "in_progress")
    @not_started = TaskBoard.where(status: "not_started")
    @no_status = TaskBoard.where(status: "no_status")
    @completed = TaskBoard.where(status: "completed")

    p '========================================='
    p '========================================='
    p '========================================='
    p @in_progress
    p @no_status
    @board = UserBord.find(params[:id])
    @tasks = TaskBoard.where(board_id: params[:id])
    p @tasks
    @bg_image = DImage.find_by_value(@board.img_value).default_image
    render 'userbord'
  end

  def new_task
    alloted_mem_list = User.find_by_name(params[:allot_mem_id])
    task = TaskBoard.new(task: params[:task], board_id: params[:board_id], user_id: @current_user.id,status: "no_status", users_id: alloted_mem_list.id)
    if task.save
      redirect_to background_path
    else
      render plain: 'failed'
    end
  end

  private

  def board_params
    params.require(:board).permit(:cover_picture)
  end
end



