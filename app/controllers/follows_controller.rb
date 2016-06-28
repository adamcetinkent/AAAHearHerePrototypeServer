class FollowsController < ApplicationController
  before_action :authenticate

  def follows_count_in
    followed_user_id = params[:user_id].to_i
    privacy = User.privacy(followed_user_id, @authenticated_user.id)
    if (privacy)
      follow_count = Follow.where(followed_user_id: followed_user_id).count
      render json: follow_count.to_s
    else
      render json: -1
    end
  end

  def follows_count_out
    user_id = params[:user_id].to_i
    privacy = User.privacy(user_id, @authenticated_user.id)
    if (privacy)
      follow_count = Follow.where(user_id: user_id).count
      render json: follow_count.to_s
    else
      render json: -1
    end
  end

  def delete 
    if Follow.with_deleted.find(params[:id]).destroy
      render :nothing => true, :status => 200
    else
      render :nothing => true, :status => 400
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

end
