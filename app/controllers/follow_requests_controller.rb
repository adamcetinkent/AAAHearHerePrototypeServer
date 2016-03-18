class FollowRequestsController < ApplicationController

  def create
    @request = FollowRequest.new(request_params)
    @deletedRequests = FollowRequest.with_deleted.where(user_id: @request.user_id, requested_user_id: @request.requested_user_id)
    if (@deletedRequests.blank?)
      puts 'NEW REQUEST'
      if @request.save
        render json: @request.to_json( :include => :requested_user )
      end
    else
      puts 'RESTORE REQUEST'
      deletedRequest = @deletedRequest.take
      deletedRequest.restore
      render json: deletedRequest.to_json( :include => :requested_user )
    end
  end

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
          render json: @follow.to_json( :include => :user )
        else
          render :nothing => true, :status => 400
        end
      else
        puts 'RESTORE FOLLOW'
        deletedFollow = @deletedFollows.take
        if deletedFollow.restore
          request.destroy
          render json: deletedFollow.to_json( :include => :user )
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
