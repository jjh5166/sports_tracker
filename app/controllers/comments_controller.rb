class CommentsController < ApplicationController
  def new

    @comment = Comment.new
    @userid = current_user.id
  end
  def create

    @comment = Comment.new(comment_params)
      if @comment.save
        flash[:message] = 'Comment Saved'
        redirect_to '/'
      else
        flash[:message] = 'Comment Not Saved'
      end
  end
  def edit
    @comment = Comment.find_by_id(params[:id])
  end
  def update
    @comment = Comment.find_by_id(params[:id])
    if @comment.update(comment_params)
      flash[:message] = 'Comment updated'
      redirect_to blogs_path
    else
      flash[:message] = 'try again'
      redirect_to edit_blog_comment_path
    end
  end
  def destroy
  end
  def comment_params
    params.require(:comment).permit(:content, :user_id, :blog_id)
  end
end
