class PostsController < ApplicationController

  def index
    posts = Post.all
    render json: Post.render_json_full(posts)
  end

  def show
    post = Post.find(params[:id])
    render json: Post.render_json_full(post)
  end

  def user_privacy
    privacy = User.is_allowed_to_see(params[:by_user_id], params[:for_user_id])
    render json: (privacy == 01 || privacy == 11 || privacy = 21 || privacy = 31).to_s
  end

  def by_user
    privacy = User.is_allowed_to_see(params[:by_user_id], params[:for_user_id])
    if privacy == 31
      # all posts:   0,1,2,3
      posts = Post.where("user_id = ?", params[:by_user_id])
    else
      tags = Post.where("user_id =?", params[:by_user_id]).collect(&:tags).flatten.uniq
      userTags = []
      tags.each do |tag|
        userTags << tag.post_id if tag.user_id == params[:for_user_id].to_i
      end
      puts userTags
      case privacy
      when 01 then
        # public posts:   0
        # tagged posts:   0,1,2,3
        posts = Post.where("user_id = ? AND 
                              (privacy = 0
                              OR id IN (?))",
                           params[:by_user_id].to_i,                          
                           userTags)
      when 10 then
        # public posts:   0
        # tagged posts:   0,1,2,3
        posts = Post.where("user_id = ? AND 
                              (privacy = 0
                              OR id IN (?))",
                           params[:by_user_id].to_i,                          
                           userTags)
      when 11 then
        # public posts:   0
        # friends posts:  1
        # tagged posts:   0,1,2,3
        posts = Post.where("user_id = ? AND 
                              (privacy = 0
                              OR privacy = 1
                              OR id IN (?))",
                           params[:by_user_id].to_i,                          
                           userTags)
      when 20 then
        # public posts:   0
        # tagged posts:   0,1,2,3
        posts = Post.where("user_id = ? AND 
                              (privacy = 0
                              OR id IN (?))",
                           params[:by_user_id].to_i,                          
                           userTags)
      when 21 then
        # public posts:   0
        # friends posts:  1
        # follower posts: 2
        # tagged posts:   0,1,2,3
        posts = Post.where("user_id = ? AND 
                              (privacy = 0
                              OR privacy = 1
                              OR privacy = 2
                              OR id IN (?))",
                           params[:by_user_id].to_i,                          
                           userTags)
      end                
    end
    render json: Post.render_json_full(posts)
  end

  def by_user_count
    post_count = Post.where(user_id: params[:user_id]).count
    #render json: "{value: '" + post_count.to_s + "'}"
    render json: post_count.to_s
  end

  def for_user
    follows = User.find(params[:user_id]).follows
    tags = Tag.where(user_id: params[:user_id]).collect(&:post_id).flatten.uniq
    posts = Post.where("user_id IN (?)
                        OR id IN (?)",
                        follows.pluck(:followed_user_id).push(params[:user_id]),
                        tags)

    render json: Post.render_json_full(posts)
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
    posts = Post.where(user_id: follows.pluck(:followed_user_id).push(params[:user_id]), lat: lat_min...lat_max, lon: lon_min...lon_max)
    render json: Post.render_json_user(posts)
  end

  def new
    post = Post.new
    post.tags.build
  end

  def create
    post = Post.new(post_params)
    if post.save
      render json: Post.render_json_full(post)
    end
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :track, :lat, :lon, :message, :place_name, :google_place_id, tags_attributes: [ :user_id ])
  end

end
