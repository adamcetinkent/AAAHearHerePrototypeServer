class LikesController < ApplicationController

  #TODO: ADD SECURITY

  def create
    like = Like.new(like_params)
    createdLike = Like.create_or_restore(like)
    notification = Notification.new(
      for_user_id:        createdLike.post.user.id,
      post_id:            createdLike.post.id,
      by_fb_user_id:      createdLike.user.id,
      notification_type:  Notification::NOTIFICATION_TYPE[:like_post],
      notification_text:  createdLike.user.first_name + " " + createdLike.user.last_name + " liked your post"
    )
    notification.save
    render json: Like.render_json_user(like)
  end

  def delete
    like = Like.with_deleted.find(params[:id])
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
  end

  private
  def like_params
    params.require(:like).permit(:post_id, :user_id)
  end

end
