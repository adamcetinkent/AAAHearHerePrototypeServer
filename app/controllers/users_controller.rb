class UsersController < ApplicationController

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
    forUser = User.find(params[:id])
    privacy1IDs = forUser.friendships.pluck(:friend_user_id)
    privacy2IDs = forUser.followeds.pluck(:user_id) | forUser.follows.pluck(:followed_user_id)
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

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :fb_user_id)
  end

end
