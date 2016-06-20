class LikesController < ApplicationController
  before_action :authenticate

  def create
    like = Like.new(like_params)
    like.user_id = @authenticated_user.id
    createdLike = Like.create_or_restore(like)
    if createdLike.post.user.id != createdLike.user.id
      notification = Notification.new(
        for_user_id:        createdLike.post.user.id,
        by_user_id:         createdLike.user.id,
        post_id:            createdLike.post.id,
        notification_type:  Notification::NOTIFICATION_TYPE[:like_post],
        notification_text:  createdLike.user.first_name + " " + createdLike.user.last_name + " liked your post"
      )
      notification.save
    end
    render json: Like.render_json_user(like)
  end

  def delete
    like = Like.with_deleted.find(params[:id])
    if like.user_id == @authenticated_user.id
      if like.destroy
        notifications = Notification.where(post_id: like.post_id, 
                                           notification_type: Notification::NOTIFICATION_TYPE[:like_post])
        notifications.each do |n|
          n.destroy
        end
        render :nothing => true, :status => 200
      else
        render :nothing => true, :status => 400
      end
    else
      render :nothing => true, :status => 401
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
  def like_params
    params.require(:like).permit(:post_id)
  end

end
