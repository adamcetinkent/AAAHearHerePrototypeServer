class PostsController < ApplicationController

  def index
    @posts = Post.all
    render json: @posts.to_json(
	:include => [
		:user, 
		{:comments => {:include => :user}}, 
		{:likes => {:include => :user}},
		{:tags => {:include => :user}}
	])
  end

  def show
    @post = Post.find(params[:id])
    render json: @post.to_json(
	:include => [
		:user, 
		{:comments => {:include => :user}}, 
		{:likes => {:include => :user}},
		{:tags => {:include => :user}}
	])
  end

  def by_user
    @posts = Post.where(user_id: params[:user_id])
    render json: @posts.to_json(
	:include => [
		:user, {
		:comments => {:include => :user}}, 
		{:likes => {:include => :user}},
		{:tags => {:include => :user}}
	])
  end

  def for_user
    follows = User.find(params[:user_id]).follows
    @posts = Post.where(user_id: follows.pluck(:followed_user_id).push(params[:user_id]))
    render json: @posts.to_json(
	:include => [
		:user, 
		{:comments => {:include => :user}}, 
		{:likes => {:include => :user}},
		{:tags => {:include => :user}}
	])
  end

  def for_user_at_location
    puts "LATITUDE =>"
    puts params[:lat]
    puts "LONGITUDE =>"
    puts params[:lng]
    range = 0.001
    lat_max = params[:lat].to_f + range
    lat_min = params[:lat].to_f - range
    lon_max = params[:lng].to_f + range
    lon_min = params[:lng].to_f - range
    follows = User.find(params[:user_id]).follows
    @posts = Post.where(user_id: follows.pluck(:followed_user_id).push(params[:user_id]), lat: lat_min...lat_max, lon: lon_min...lon_max)
    render json:@posts.to_json(
	:include => [
		:user
	])
  end

  def new
    @post = Post.new
    @post.tags.build
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post.to_json(
	:include => [
		:user, 
		{:comments => {:include => :user}}, 
		{:likes => {:include => :user}},
		{:tags => {:include => :user}}
	])
    end
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :track, :lat, :lon, :message, :place_name, :google_place_id, tags_attributes: [ :user_id ])
  end

end
