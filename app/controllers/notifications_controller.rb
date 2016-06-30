class NotificationsController < ApplicationController
  before_action :authenticate

  #def new(user_id, notification_type, notification_link)
  #  puts "NOTIFICATION: " + notification_type.to_s + " " + notification_link.to_s
  #end

  def all
    for_user_id = @authenticated_user.id
    notifications = Notification.where(for_user_id: for_user_id, notification_type: [0,1,2,3,4])
                                .order(created_at: :desc)
    notifications.each do |n|
      if (n.sent_at == nil)
        n.sent_at = Time.now
        n.save
      end
    end
    render json: Notification.render_json_full(notifications)
  end

  def unsent
    for_user_id = @authenticated_user.id
    notifications = Notification.where(for_user_id: for_user_id, read_at: nil, sent_at: nil)
    notifications.each do |n|
      n.sent_at = Time.now
      n.save
    end
    render json: Notification.render_json_full(notifications)
  end

  def read
    for_user_id = @authenticated_user.id
    notification_id = params[:id]
    notification = Notification.find(notification_id)
    if notification.for_user_id == for_user_id
      notification.read_at = Time.now
      notification.save
      render json: notification.to_json
    else
      render json: :nothing, status: 401
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
