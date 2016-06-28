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

  RELATIONSHIP = {
    :self           => 0,
    :follower       => 1,
    :friend         => 2,
    :none           => 3
  }

  PROFILE_PRIVACY = {
    :public     => 0,
    :friends    => 1,
    :followers  => 2
  }

  SEARCH_PRIVACY = {
    :public   => 0,
    :friends  => 1,
    :private  => 2
  }

  AUTO_ACCEPT = {
    :manual     => 0,
    :friends    => 1,
    :automatic  => 2
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

  def self.relationship(target_id, source_id)
    if target_id == source_id
      RELATIONSHIP[:self]
    else
      if !User.find(source_id).follows
              .where(followed_user_id: target_id).blank?
        RELATIONSHIP[:follower]
      else
        if !User.find(source_id).friendships
                .where(friend_user_id: target_id).blank?
          RELATIONSHIP[:friend]
        else
          RELATIONSHIP[:none]
        end
      end
    end
  end

  def self.privacy(target_id, source_id)
    relationship = User.relationship(target_id, source_id)
    target_privacy = User.find(target_id).profile_privacy
    (relationship == RELATIONSHIP[:self]) ||
    (target_privacy == PROFILE_PRIVACY[:public]) ||
    (relationship == RELATIONSHIP[:follower]) ||
    (relationship == RELATIONSHIP[:friend] && (target_privacy == PROFILE_PRIVACY[:friends]))
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
