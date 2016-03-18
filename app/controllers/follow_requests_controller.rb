class FollowRequestsController < ApplicationController

  def accept
    request = FollowRequest.find(params[:id])
    puts request.to_json
    if request.blank?
      render :nothing => true, :status => 400
    else
      @follow = Follow.new
      @follow.user_id = request.user_id
      @follow.followed_user_id = request.requested_user_id
      puts @follow.to_json
      @deletedFollows = Follow.with_deleted.where(user_id: @follow.user_id, followed_user_id: @follow.followed_user_id)
      if (@deletedFollow.blank?)
        puts 'NEW FOLLOW'
        if @follow.save
          request.destroy
          render json: @follow.to_json
        else
          render :nothing => true, :status => 400
        end
      else
        puts 'RESTORE FOLLOW'
        deletedFollow = @deletedFollows.take
        if deletedFollow.restore
          request.destroy
          render json: deletedFollow.to_json
        else
          render :nothing => true, :status => 400
        end
      end
    end
  end

end
