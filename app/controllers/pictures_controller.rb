class PicturesController < ApplicationController
  def new
    @pic = Picture.new
    @userid = current_user.id
    @gameid = params[:gameid]
  end
  def show
    @pic = Picture.find_by_id(params[:id])
    @comments = Comment.where(picture_id: params[:id])
    
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
    else
      flash[:notice] = 'Could not save picture'
      redirect_to new_picture_path
    end
  end
  def edit
    @pic = Picture.find_by_id(params[:id])
  end
  def update
    @pic = Picture.find(params[:id])
    if @pic.update(pic_params)
      flash[:notice] = "Picture updated successfully"
      redirect_to user_profile_path(current_user.username)
    else
      flash[:notice] = 'Edits did not save'
      redirect_to edit_picture_path
    end
  end
  def destroy
    pic = Picture.find_by_id(params[:id])
    pic.destroy
    redirect_to user_profile_path(current_user.username)
  end
private
  def pic_params
    params.require(:picture).permit(:description, :game_id, :user_id, :image)
  end
end
