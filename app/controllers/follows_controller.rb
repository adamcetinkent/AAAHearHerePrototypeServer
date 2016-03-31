class FollowsController < ApplicationController

  def follows_count_in
    follow_count = Follow.where(followed_user_id: params[:user_id]).count
    render json: follow_count.to_s
  end

  def follows_count_out
    follow_count = Follow.where(user_id: params[:user_id]).count
    render json: follow_count.to_s
  end

  def delete 
    if Follow.with_deleted.find(params[:id]).destroy
      render :nothing => true, :status => 200
    else
      render :nothing => true, :status => 400
    end
  end

end
