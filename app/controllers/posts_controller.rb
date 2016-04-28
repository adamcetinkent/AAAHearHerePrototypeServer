class PostsController < ApplicationController
  before_action :authenticate

  def index
    posts = Post.all
    render json: Post.render_json_full(posts)
  end

  def show
    #TODO: ADD SECURITY TO THIS
    post = Post.find(params[:id])
    render json: Post.render_json_full(post)
  end

  def user_privacy
    by_user_id = params[:by_user_id].to_i
    for_user_id = @authenticated_user.id
    privacy = User.is_allowed_to_see(by_user_id, for_user_id)
    puts "Privacy: " + privacy.to_s
    privacyBool = (privacy == 01 || privacy == 11 || privacy == 21 || privacy == 31)
    puts "PrivacyBool: " + privacyBool.to_s
    render json: privacyBool.to_s
  end

  def by_user
    if params[:date] then
      date = params[:date].to_datetime
    else
      date = DateTime.now
    end
    by_user_id = params[:by_user_id].to_i
    for_user_id = @authenticated_user.id
    privacy = User.is_allowed_to_see(by_user_id, for_user_id)
    if privacy == 31
      # all posts:   0,1,2,3
      posts = Post.order(created_at: :desc)
                  .where("created_at < ?
                         AND user_id = ?",
                         date,
                         by_user_id)
                  .limit(5)
    else
      tags = Post.where("user_id =?", by_user_id).collect(&:tags).flatten.uniq
      userTags = []
      tags.each do |tag|
        userTags << tag.post_id if tag.user_id == for_user_id
      end
      #puts userTags
      case privacy
      when 01 then
        # public posts:   0
        # tagged posts:   0,1,2,3
        posts = Post.order(created_at: :desc)
                    .where("created_at < ? AND
                            user_id = ? AND
                              (privacy = 0
                              OR id IN (?))",
                           date,
                           by_user_id,
                           userTags)
                    .limit(5)
      when 10 then
        # public posts:   0
        # tagged posts:   0,1,2,3
        posts = Post.order(created_at: :desc)
                    .where("created_at < ? AND
                            user_id = ? AND
                              (privacy = 0
                              OR id IN (?))",
                           date,
                           by_user_id,
                           userTags)
                    .limit(5)
      when 11 then
        # public posts:   0
        # friends posts:  1
        # tagged posts:   0,1,2,3
        posts = Post.order(created_at: :desc)
                    .where("created_at < ? AND
                            user_id = ? AND
                              (privacy = 0
                              OR privacy = 1
                              OR id IN (?))",
                           date,
                           by_user_id,
                           userTags)
                    .limit(5)
      when 20 then
        # public posts:   0
        # tagged posts:   0,1,2,3
        posts = Post.order(created_at: :desc)
                    .where("created_at < ? AND
                            user_id = ? AND
                              (privacy = 0
                              OR id IN (?))",
                           date,
                           by_user_id,
                           userTags)
                    .limit(5)
      when 21 then
        # public posts:   0
        # friends posts:  1
        # follower posts: 2
        # tagged posts:   0,1,2,3
        posts = Post.order(created_at: :desc)
                    .where("created_at < ? AND
                            user_id = ? AND
                              (privacy = 0
                              OR privacy = 1
                              OR privacy = 2
                              OR id IN (?))",
                           date,
                           by_user_id,
                           userTags)
                    .limit(5)
      end
    end
    render json: Post.render_json_full(posts)
  end

  def by_user_count
    user_id = params[:user_id].to_i
    post_count = Post.where(user_id: user_id).count
    render json: post_count.to_s
  end

  def for_user
    for_user_id = @authenticated_user.id
    follows = User.find(for_user_id).follows
    tags = Tag.where(user_id: for_user_id).collect(&:post_id).flatten.uniq
    posts = Post.where("user_id IN (?)
                        OR id IN (?)",
                        follows.pluck(:followed_user_id).push(for_user_id),
                        tags)

    render json: Post.render_json_full(posts)
  end

  def for_user_before
    for_user_id = @authenticated_user.id
    if params[:date] then
      date = params[:date].to_datetime
    else
      date = DateTime.now
    end
    if (params[:excludeIDs].present?)
      excludeIDs = params[:excludeIDs].split(",").map{|s| s.to_i}
    else
      excludeIDs = Array.new(1, 0)
    end
    follows = User.find(for_user_id).follows
    tags = Tag.where(user_id: for_user_id).collect(&:post_id).flatten.uniq
    posts = Post.order(created_at: :desc)
                .where("id NOT IN (?)
                        AND created_at < ?
                        AND (user_id IN (?)
                          OR id IN (?))",
                        excludeIDs,
                        date,
                        follows.pluck(:followed_user_id).push(for_user_id),
                        tags)
                .limit(5)

    render json: Post.render_json_full(posts)
  end

  def for_user_since
    for_user_id = @authenticated_user.id
    date = params[:date].to_datetime
    follows = User.find(for_user_id).follows
    tags = Tag.where(user_id: for_user_id).collect(&:post_id).flatten.uniq
    posts = Post.where("created_at >= ? AND (
                          user_id IN (?)
                          OR id IN (?)
                        )",
                        date,
                        follows.pluck(:followed_user_id).push(for_user_id),
                        tags)

    render json: Post.render_json_full(posts)
  end

  def for_user_at_location
    puts "LATITUDE =>"
    puts params[:lat]
    puts "LONGITUDE =>"
    puts params[:lon]
    range = 0.001
    lat_max = params[:lat].to_f + range
    lat_min = params[:lat].to_f - range
    lon_max = params[:lon].to_f + range
    lon_min = params[:lon].to_f - range
    for_user_id = @authenticated_user.id
    follows = User.find(for_user_id).follows
    tags = Tag.where(user_id: for_user_id).collect(&:post_id).flatten.uniq
    posts = postsWithinBounds(follows.pluck(:followed_user_id).push(for_user_id),
                              tags,
                              lat_min,
                              lat_max,
                              lon_min,
                              lon_max,
                              Array.new(1, 0))
    render json: Post.render_json_user(posts)
  end

  def for_user_within_bounds
    latSW = params[:latSW].to_f
    latNE = params[:latNE].to_f
    lonSW = params[:lonSW].to_f
    lonNE = params[:lonNE].to_f
    for_user_id = @authenticated_user.id
    follows = User.find(for_user_id).follows
    tags = Tag.where(user_id: for_user_id).collect(&:post_id).flatten.uniq
    if (params[:excludeIDs].present?)
      excludeIDs = params[:excludeIDs].split(",").map{|s| s.to_i}
    else
      excludeIDs = Array.new(1, 0)
    end
    posts = postsWithinBounds(follows.pluck(:followed_user_id).push(user_id),
                              tags,
                              latSW,
                              latNE,
                              lonSW,
                              lonNE,
                              excludeIDs)
    render json: Post.render_json_user(posts)
  end

  def postsWithinBounds(userIDs, tagIDs, latSW, latNE, lonSW, lonNE, excludeIDs)
    if (lonSW <= lonNE)
      Post.where("id NOT IN (?)
                  AND (user_id IN (?)
                        OR id IN (?))
                  AND lat BETWEEN ? AND ?
                  AND lon BETWEEN ? AND ?",
                  excludeIDs,
                  userIDs,
                  tagIDs,
                  latSW, latNE,
                  lonSW, lonNE)
    else
      Post.where("id NOT IN (?)
                  AND (user_id IN (?)
                        OR id IN (?))
                  AND lat BETWEEN ? AND ?
                  AND (lon > ? OR lon < ?)",
                  excludeIDs,
                  userIDS,
                  tagIDs,
                  latSW, latNE,
                  lonSW, lonNE)
    end
  end

  def new
    post = Post.new
    post.tags.build
  end

  def create
    post = Post.new(post_params)
    if post.user_id != @authenticated_user.id
      render json: :nothing, status: 401
    else
      if post.save
        render json: Post.render_json_full(post)
      end
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
  def post_params
    params.require(:post).permit(:user_id, :track, :lat, :lon, :message, :place_name, :google_place_id, tags_attributes: [ :user_id ])
  end

end
