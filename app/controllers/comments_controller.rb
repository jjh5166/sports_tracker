class CommentsController < ApplicationController
  def new

    @comment = Comment.new
    @comments = Comment.where(picture_id: params[:picture_id])
    
  end
  def create
    @comment = Comment.new(comment_params)
      if @comment.save
        flash[:notice] = 'Comment Saved'
        redirect_to request.referer
      else
        flash[:notice] = 'Comment was not Saved'
        redirect_to request.referer
      end
  end
  def edit
    @comment = Comment.find_by_id(params[:id])
  end
  def update
    @comment = Comment.find_by_id(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = 'Comment updated'
      redirect_to request.referer
    else
      flash[:notice] = 'Comment was not Saved'
      redirect_to request.referer
    end
  end
  def destroy
  end
  def comment_params
    params.require(:comment).permit(:content, :user_id, :picture_id)
  end
end
