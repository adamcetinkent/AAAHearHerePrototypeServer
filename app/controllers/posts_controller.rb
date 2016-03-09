class PostsController < ApplicationController

  def index
    @posts = Post.all
    render json: @posts.to_json(:include => [:user, {:comments => {:include => :user}}, {:likes => {:include => :user}}])
  end

  def show
    @post = Post.find(params[:id])
    render json: @post.to_json(:include => [:user, {:comments => {:include => :user}}, {:likes => {:include => :user}}])
  end

  def by_user
    @posts = Post.where(user_id: params[:user_id])
    render json: @posts.to_json(:include => [:user, {:comments => {:include => :user}}, {:likes => {:include => :user}}])
  end

  def for_user
    friendships = User.find(params[:user_id]).friendships
    @posts = Post.where(user_id: friendships.pluck(:friend_user_id).push(params[:user_id]))
    render json: @posts.to_json(:include => [:user, {:comments => {:include => :user}}, {:likes => {:include => :user}}])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post.to_json(:include => [:user, {:comments => {:include => :user}}, {:likes => {:include => :user}}])
    end
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :track, :lat, :lon, :message, :place_name, :google_place_id)
  end

end
