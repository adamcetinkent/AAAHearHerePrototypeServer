class UsersController < ApplicationController

  def index
    @users = User.all
    #render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user.to_json(:include => {:friendships => {:include => :friend_user }} )
  end

  def validate
    @token = params[:id]
    render json: @token
  end

  def create
    @user = User.new(user_params)
    if @user.save
      respond_to do |format|
        format.json{render json: @user}
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :fb_user_id)
  end

end
