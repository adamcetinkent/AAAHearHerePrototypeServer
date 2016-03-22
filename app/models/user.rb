class User < ActiveRecord::Base
  acts_as_paranoid

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

end
