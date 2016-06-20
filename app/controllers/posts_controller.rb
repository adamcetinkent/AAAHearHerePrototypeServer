class PostsController < ApplicationController
  before_action :authenticate

  def show
    post = Post.find(params[:id])
    puts 'POST: '+post.to_s
    for_user_id = @authenticated_user.id
    post_user = post.user
    privacy = User.is_allowed_to_see(post.user.id, for_user_id)
    can_see = false
    case privacy
    when User::PRIVACY[:self_good] then
      can_see = true
    when User::PRIVACY[:none_good] then
      if post.privacy == Post::POST_PRIVACY[:public]
        can_see = true
      end
    when User::PRIVACY[:friends_bad] then
      if post.privacy == Post::POST_PRIVACY[:public]
        can_see = true
      end
    when User::PRIVACY[:friends_good] then
      if (post.privacy == Post::POST_PRIVACY[:public] ||
          post.privacy == Post::POST_PRIVACY[:friends])
        can_see = true
      end
    when User::PRIVACY[:followers_bad] then
      if post.privacy == Post::POST_PRIVACY[:public]
        can_see = true
      end 
    when User::PRIVACY[:followers_good] then
      if (post.privacy == Post::POST_PRIVACY[:public] ||
          post.privacy == Post::POST_PRIVACY[:friends] ||
          post.privacy == Post::POST_PRIVACY[:followers])
        can_see = true
      end 
    end
    if !can_see && !post.tags.where(user_id: for_user_id).blank?
      can_see = true
    end
    if can_see
      if (post.user.id != for_user_id)
        if !Friendship.are_friends(@authenticated_user, post.user.id)
          Post.dummyLocations(post)
        end
      end
      render json: Post.render_json_full(post)
    else
      render json: :nothing, status: 401
    end
  end

  def user_privacy
    by_user_id = params[:by_user_id].to_i
    for_user_id = @authenticated_user.id
    privacy = User.is_allowed_to_see(by_user_id, for_user_id)
    puts "Privacy: " + privacy.to_s
    privacyBool = (privacy == User::PRIVACY[:self_good] || 
                   privacy == User::PRIVACY[:none_good] || 
                   privacy == User::PRIVACY[:friends_good] || 
                   privacy == User::PRIVACY[:followers_good])
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
    if privacy == User::PRIVACY[:self_good]
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
      when User::PRIVACY[:none_good] then
        # public posts:   0
        # tagged posts:   0,1,2,3
        posts = Post.order(created_at: :desc)
                    .where("created_at < ? AND
                            user_id = ? AND
                              (privacy = ?
                              OR id IN (?))",
                           date,
                           by_user_id,
                           Post::POST_PRIVACY[:public],
                           userTags)
                    .limit(5)
      when User::PRIVACY[:friends_bad] then
        # public posts:   0
        # tagged posts:   0,1,2,3
        posts = Post.order(created_at: :desc)
                    .where("created_at < ? AND
                            user_id = ? AND
                              (privacy = ?
                              OR id IN (?))",
                           date,
                           by_user_id,
                           Post::POST_PRIVACY[:public],
                           userTags)
                    .limit(5)
      when User::PRIVACY[:friends_good] then
        # public posts:   0
        # friends posts:  1
        # tagged posts:   0,1,2,3
        posts = Post.order(created_at: :desc)
                    .where("created_at < ? AND
                            user_id = ? AND
                              (privacy = ?
                              OR privacy = ?
                              OR id IN (?))",
                           date,
                           by_user_id,
                           Post::POST_PRIVACY[:public],
                           Post::POST_PRIVACY[:friends],
                           userTags)
                    .limit(5)
      when User::PRIVACY[:followers_bad] then
        # public posts:   0
        # tagged posts:   0,1,2,3
        posts = Post.order(created_at: :desc)
                    .where("created_at < ? AND
                            user_id = ? AND
                              (privacy = ?
                              OR id IN (?))",
                           date,
                           by_user_id,
                           Post::POST_PRIVACY[:public],
                           userTags)
                    .limit(5)
      when User::PRIVACY[:followers_good] then
        # public posts:   0
        # friends posts:  1
        # follower posts: 2
        # tagged posts:   0,1,2,3
        posts = Post.order(created_at: :desc)
                    .where("created_at < ? AND
                            user_id = ? AND
                              (privacy = ?
                              OR privacy = ?
                              OR privacy = ?
                              OR id IN (?))",
                           date,
                           by_user_id,
                           Post::POST_PRIVACY[:public],
                           Post::POST_PRIVACY[:friends],
                           Post::POST_PRIVACY[:followers],
                           userTags)
                    .limit(5)
      end
    end
    if (by_user_id != for_user_id)
      if !Friendship.are_friends(@authenticated_user, by_user_id)
        Post.dummyLocations(posts)
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
    posts = Post.where("(user_id IN (?) 
                          AND (privacy = ? 
                                OR privacy = ?
                                OR privacy = ?)                               
                        OR id IN (?)",
                        follows.pluck(:followed_user_id).push(for_user_id),
                        Post::POST_PRIVACY[:public],
                        Post::POST_PRIVACY[:friends],
                        Post::POST_PRIVACY[:followers],
                        tags)

    posts.each do |post|
      if (post.user.id != for_user_id)
        if !Friendship.are_friends(@authenticated_user, post.user.id)
          Post.dummyLocations(posts)
        end
      end
    end
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

    posts.each do |post|
      if (post.user.id != for_user_id)
        if !Friendship.are_friends(@authenticated_user, post.user.id)
          Post.dummyLocations(posts)
        end
      end
    end
    render json: Post.render_json_full(posts)
  end

  def for_user_since
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
                        AND created_at > ?
                        AND (user_id IN (?)
                          OR id IN (?))",
                        excludeIDs,
                        date,
                        follows.pluck(:followed_user_id).push(for_user_id),
                        tags)
                .limit(5)
    posts.each do |post|
      if (post.user.id != for_user_id)
        if !Friendship.are_friends(@authenticated_user, post.user.id)
          Post.dummyLocations(posts)
        end
      end
    end
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
    mutes = Mute.where(user_id: for_user_id).collect(&:post_id).flatten.uniq
    puts "MUTES: " + mutes.to_s
    posts = postsWithinBounds(follows.pluck(:followed_user_id).push(for_user_id),
                              tags,
                              lat_min,
                              lat_max,
                              lon_min,
                              lon_max,
                              mutes)
    notifications = []
    posts.each do |post|
      recent_notification = Notification.where(
        for_user_id:        for_user_id,
        post_id:            post.id,
        notification_type:  Notification::NOTIFICATION_TYPE[:post_location]
      ).where(
        'sent_at > ?',
        1.day.ago
      )
      if recent_notification.blank?
        notification = Notification.new(
          for_user_id:        for_user_id,
          by_user_id:         post.user_id,
          post_id:            post.id,
          notification_type:  Notification::NOTIFICATION_TYPE[:post_location],
          sent_at:            Time.now
        )
        notification.save
        notifications |= [notification]
        puts "NEW NOTIFICATION: " + notification.id.to_s
      end
    end
    render json: Notification.render_json_full(notifications)
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
    posts = postsWithinBounds(follows.pluck(:followed_user_id).push(for_user_id),
                              tags,
                              latSW,
                              latNE,
                              lonSW,
                              lonNE,
                              excludeIDs)
    
    posts.each do |post|
      if (post.user.id != for_user_id)
        if !Friendship.are_friends(@authenticated_user, post.user.id)
          Post.dummyLocations(posts)
        end
      end
    end
    render json: Post.render_json_user(posts)
  end

  def postsWithinBounds(userIDs, tagIDs, latSW, latNE, lonSW, lonNE, excludeIDs)
    if (lonSW <= lonNE)
      allPosts =  Post.where(
        "id NOT IN (?)
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
      Post.where(
        "id NOT IN (?)
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
        followers = post.user.followeds
        notify_user_ids = []
        followers.each do |u|
          notify_user_ids |= [u.user.id]
        end
        tags = Tag.where(post_id: post.id)
        tags.each do |t|
          notify_user_ids |= [t.user.id]
        end
        notify_user_ids.each do |id|
          by_user = User.find(@authenticated_user.id)
          notification = Notification.new(
            for_user_id:        id,
            by_user_id:         by_user.id,
            post_id:            post.id,
            notification_type:  Notification::NOTIFICATION_TYPE[:new_post],
            notification_text:  by_user.first_name + " " + by_user.last_name + " posted to Hear Here"
          )
          notification.save
        end
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
    params.require(:post).permit(:user_id, :track, :lat, :lon, :message, :place_name, :google_place_id, :privacy, :dummy_lat, :dummy_lon, tags_attributes: [ :user_id ])
  end

end
