class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :read

  def create
    @user = current_user
    @comment = Comment.create(comment_params)
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(body: params[:comment][:body])   
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy    
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :body)
  end

  def read
    authorize! :read, current_user, message: 'Banned' if current_user.banned?
  end
end
