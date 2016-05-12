class CommentsController < ApplicationController

  #TODO: ADD SECURITY

  def create
    comment = Comment.new(comment_params)
    if comment.save
      # INITIALLY, JUST POST OWNER
      notification = Notification.new(
        for_user_id:        comment.post.user.id,
        post_id:            comment.post.id,
        by_fb_user_id:      comment.user.fb_user_id,
        notification_type:  Notification::NOTIFICATION_TYPE[:new_comment],
        notification_text:  comment.user.first_name + " " + comment.user.last_name + " commented on your post"
      )
      notification.save
      render json: comment.to_json
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:post_id, :user_id, :message)
  end

end
