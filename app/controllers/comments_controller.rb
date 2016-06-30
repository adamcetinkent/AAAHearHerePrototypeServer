class CommentsController < ApplicationController
  before_action :authenticate

  # add checks that authenticated user is allowed to do things!

  def create
    comment = Comment.new(comment_params)
    if comment.save
      # INITIALLY, JUST POST OWNER
      if comment.post.user.id != comment.user.id
        notification = Notification.new(
          for_user_id:        comment.post.user.id,
          by_user_id:         comment.user.id,
          post_id:            comment.post.id,
          notification_type:  Notification::NOTIFICATION_TYPE[:new_comment],
          notification_text:  comment.user.first_name + " " + comment.user.last_name + " commented on your post"
        )
        notification.save
      end
      # OTHERS WHO HAVE COMMENTED
      other_commenter_ids = []
      comment.post.comments.each do |c|
        puts "COMMENT: " + c.id.to_s + " (user: "+c.user.id.to_s+")"
        other_commenter_ids |= [c.user.id]
      end
      puts "other_ids: "+other_commenter_ids.to_s
      other_commenter_ids.each do |id|
        if id != comment.user.id
          notification = Notification.new(
            for_user_id:        id,
            by_user_id:         comment.user.id,
            post_id:            comment.post.id,
            notification_type:  Notification::NOTIFICATION_TYPE[:new_comment],
            notification_text:  comment.user.first_name + " " + comment.user.last_name + " also commented on a post"
          )
          notification.save
        end
      end
      render json: comment.to_json
    end
  end

  protected
  def authenticate
    authenticate_token || render_unauthorised
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      @authenticated_user = User.find_by(auth_token: token)
    end
  end

  def render_unauthorised
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render json: 'Bad credentials', status: 401
  end

  private
  def comment_params
    params.require(:comment).permit(:post_id, :user_id, :message)
  end

end
