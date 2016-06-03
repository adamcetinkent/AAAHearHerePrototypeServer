class User < ActiveRecord::Base
  acts_as_paranoid
  before_create :set_auth_token

  has_many :posts
  has_many :comments
  has_many :likes
  has_many :friendships
  has_many :friend_users, :through => :friendships
  has_many :follows
  has_many :followeds, :class_name => "Follow", :foreign_key => "followed_user_id"
  has_many :follow_requests
  has_many :followed_requests, :class_name => "FollowRequest", :foreign_key => "requested_user_id"
  has_many :notifications, :foreign_key => "for_user_id"

  PRIVACY = {
    :self_good      => 31,
    :none_good      => 01,
    :friends_bad    => 10,
    :friends_good   => 11,
    :followers_bad  => 20,
    :followers_good => 21
  }

  PROFILE_PRIVACY = {
    :public     => 0,
    :friends    => 1,
    :followers  => 2
  }

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
      PRIVACY[:self_good]
    else
      byUser = User.find(by_user_id)
      if !User.find(for_user_id).follows
              .where(followed_user_id: by_user_id).blank?
        PRIVACY[:followers_good]
      else
        if byUser.profile_privacy == PROFILE_PRIVACY[:followers]
          PRIVACY[:followers_bad]
        else
          if !User.find(for_user_id).friendships
                  .where(friend_user_id: by_user_id).blank?
              PRIVACY[:friends_good]
          else
            if byUser.profile_privacy == PROFILE_PRIVACY[:friends]
              PRIVACY[:friends_bad]
            else
              if byUser.profile_privacy == PROFILE_PRIVACY[:public]
                PRIVACY[:none_good]
              end
            end
          end
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
