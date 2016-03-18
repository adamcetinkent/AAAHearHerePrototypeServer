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

end
