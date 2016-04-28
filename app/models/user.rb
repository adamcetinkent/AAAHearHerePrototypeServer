class User < ActiveRecord::Base
  acts_as_paranoid
  before_create :set_auth_token

  has_many :posts
  has_many :comments
  has_many :likes
  has_many :friendships
  has_many :follows
  has_many :followeds, :class_name => "Follow", :foreign_key => "followed_user_id"
  has_many :follow_requests
  has_many :followed_requests, :class_name => "FollowRequest", :foreign_key => "requested_user_id"

  def full_name
    '#{first_name} #{last_name}'
  end

  def self.render_to_json(user)
    user.to_json
  end

  def self.render_to_json_full(user)
    user.to_json(
      :include => [
        {:friendships       => {:include => :friend_user    }},
        {:follows           => {:include => :followed_user  }},
        {:followeds         => {:include => :user           }},
        {:follow_requests   => {:include => :requested_user }},
        {:followed_requests => {:include => :user           }},
      ]
    )
  end

  def self.is_allowed_to_see(by_user_id, for_user_id)
    if by_user_id == for_user_id
      puts "FOR SELF!"
      31
    else
      byUser = User.find(by_user_id)
      case byUser.profile_privacy
      when 0 then
        puts "NO PRIVACY"
        01
      when 1 then
        if User.find(for_user_id).friendships
            .where(friend_user_id: by_user_id).blank? &&
           User.find(for_user_id).follows
            .where(followed_user_id: by_user_id).blank?
          puts "FRIENDS PRIVACY: DENIED"
          10
        else
          puts "FRIENDS PRIVACY: ALLOWED"
          11
        end
      when 2 then
        if User.find(for_user_id).follows
               .where(followed_user_id: by_user_id).blank?
          puts "FOLLOWERS PRIVACY: DENIED"
          20
        else
          puts "FOLLOWERS PRIVACY: ALLOWED"
          21
        end
      end
    end
  end

  def new_auth_token
    self.auth_token = generate_auth_token
    self.save
  end

  private
  def set_auth_token
    return if auth_token.present?
    self.auth_token = generate_auth_token
  end

  def generate_auth_token
    SecureRandom.uuid.gsub(/\-/,'')
  end

end
