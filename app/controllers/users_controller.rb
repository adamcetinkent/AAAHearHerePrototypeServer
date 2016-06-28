class UsersController < ApplicationController
  before_action :authenticate, except: [:create]

  def index
    users = User.all
    #render json: @users
  end

  def show
    user = User.find(params[:id])
    render json: User.render_to_json_full(user)
  end

  def search_users
    splitQuery = params[:query].split.map {|val| "%#{val}%"}
    foundUsersAll = User.where("concat(first_name, ' ', last_name) ILIKE ALL ( array [?] )", splitQuery)
    privacy1IDs = @authenticated_user.friendships.pluck(:friend_user_id)
    privacy2IDs = @authenticated_user.followeds.pluck(:user_id) | @authenticated_user.follows.pluck(:followed_user_id)
    foundUsersFiltered = foundUsersAll.where("search_privacy = 0 
                                             OR id = ? 
                                             OR (search_privacy = 1 AND id in (?)) 
                                             OR (search_privacy = 2 AND id in (?))",
                                             params[:id],
                                             privacy1IDs,
                                             privacy2IDs)
    render json: User.render_to_json(foundUsersFiltered)
  end

  def create
    user = User.new(user_params)
    if user.save
      User.render_to_json(user)
    end
  end

  def profile_privacy
    target_id = params[:target_id].to_i
    source_id = @authenticated_user.id
    privacy = User.privacy(target_id, source_id)
    puts "PrivacyBool: " + privacy.to_s
    render json: privacy.to_s
  end
  
  def update_profile_privacy
    level = params[:level].to_i
    @authenticated_user.profile_privacy = level
    if @authenticated_user.save
      render json: @authenticated_user.profile_privacy
    else
      render json: -1
    end
  end

  def update_search_privacy
    level = params[:level].to_i
    @authenticated_user.search_privacy = level
    if @authenticated_user.save
      render json: @authenticated_user.search_privacy
    else
      render json: -1
    end
  end

  def update_auto_accept
    level = params[:level].to_i
    @authenticated_user.auto_accept = level
    if @authenticated_user.save
      render json: @authenticated_user.auto_accept
    else
      render json: -1
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
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :fb_user_id)
  end

end
