class FollowRequestsController < ApplicationController

  def create
    request = FollowRequest.new(request_params)

    requested = User.find(request.requested_user_id)
    auto = requested.auto_accept
    puts "AUTO ACCEPT?"
    puts auto
    if auto == 2
      puts "AUTO ACCEPT ALL!"
      follow = Follow.new
      follow.user_id = request.user_id
      follow.followed_user_id = request.requested_user_id
      createdFollow = Follow.create_or_restore(follow)
      render json: Follow.render_json_followed(createdFollow)
    elsif auto == 1
      puts "AUTO ACCEPT FRIENDS"
      @friends = Friendship.where(user_id: request.requested_user_id, friend_user_id: request.user_id)
      if (@friends.blank?)
        puts 'NOT FRIENDS!'
        followRequest = FollowRequest.create_or_restore(request)
        render json: FollowRequest.render_json(followRequest)
      else
        puts 'FRIENDS!'
        follow = Follow.new
        follow.user_id = request.user_id
        follow.followed_user_id = request.requested_user_id
        createdFollow = Follow.create_or_restore(follow)
        render json: Follow.render_json_followed(createdFollow)
      end
    else
      puts "AUTO ACCEPT NONE"
      followRequest = FollowRequest.create_or_restore(request)
      render json: FollowRequest.render_json(followRequest)
    end
  end

  def accept
    request = FollowRequest.find(params[:id])
    puts request.to_json
    if request.blank?
      render :nothing => true, :status => 400
    else
      follow = Follow.new
      follow.user_id = request.user_id
      follow.followed_user_id = request.requested_user_id
      deletedFollows = Follow.with_deleted.where(user_id: follow.user_id, followed_user_id: follow.followed_user_id)
      if (deletedFollow.blank?)
        puts 'NEW FOLLOW'
        if follow.save
          request.destroy
          render json: Follow.render_json_user(follow)
        else
          render :nothing => true, :status => 400
        end
      else
        puts 'RESTORE FOLLOW'
        deletedFollow = deletedFollows.take
        if deletedFollow.restore
          request.destroy
          render json: Follow.render_json_user(deletedFollow)
        else
          render :nothing => true, :status => 400
        end
      end
    end
  end

  def delete
    if FollowRequest.with_deleted.find(params[:id]).destroy
      render :nothing => true, :status => 200
    else
      render :nothing => true, :status => 400
    end
  end

  private
  def request_params
    params.require(:follow_request).permit(:user_id, :requested_user_id)
  end

end
