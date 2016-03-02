class PostsController < ApplicationController

  def index
    @posts = Post.all
    render json: @posts.to_json(:include => [:user, :comments => {:include => :user}])
  end

  def show
    @post = Post.find(params[:id])
    render json: @post.to_json(:include => [:user, :comments => {:include => :user}])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      @user = User.find(@post.user_id)
      #respond_to do |format|
      #  format.json{render json: {:post => @post, :user => @user}}
      #end
      render json: @post.to_json(:include => [:user, :comments => {:include => :user}])
    end
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :track, :lat, :lon, :message)
  end

end
