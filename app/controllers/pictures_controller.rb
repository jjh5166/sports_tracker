class PicturesController < ApplicationController
  def new
    @pic = Picture.new
    @userid = current_user.id
    @gameid = params[:gameid]
  end
  def show
    @pic = Picture.find_by_id(params[:id])
  end
  def create
    pic = Picture.new(pic_params)
    redirection = nil
    if params[:url].present?
      redirection = Base64.decode64(params[:url].to_s)
    end
    if pic.save
      if redirection.present?
        path = redirection
      else
        path = new_picture_path
      end
      flash[:notice] = 'Picture Saved'
      redirect_to path
      # redirect_to :back
    else
      flash[:notice] = 'Could not save picture'
      redirect_to new_picture_path
    end
  end
private
  def pic_params
    params.require(:picture).permit(:description, :game_id, :user_id, :image)
  end
end
