class MutesController < ApplicationController
  before_action :authenticate

  def create
    post_id = params[:post_id].to_i
    mute = Mute.new(post_id: post_id, user_id: @authenticated_user.id)
    createdMute = Mute.create_or_restore(mute)
    render json: mute.to_json
  end

  def delete
    post_id = params[:post_id].to_i
    mute = Mute.with_deleted.where(post_id: post_id, user_id: @authenticated_user.id).take
    if mute.destroy
      render json: mute.to_json
    else
      render :nothing => true, status => 400
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
