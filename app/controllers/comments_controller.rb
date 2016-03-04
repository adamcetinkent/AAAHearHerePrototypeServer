class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment.to_json
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:post_id, :user_id, :message)
  end

end
