class BookCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = BookComment.new(book_comment_params)
    @comment.assign_attributes(
      user_id: current_user.id,
      book_id: params[:book_id]
    )
    @comment.save
    redirect_to request.referrer
  end

  def destroy
    @comment = BookComment.find(params[:book_comment_id])
    @comment.destroy
    redirect_to request.referrer
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
