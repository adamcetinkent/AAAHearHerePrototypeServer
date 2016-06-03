class Post < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :tags
  has_many :notifications
#  has_many :tagged_users, through: :tags, :class_name => "User"

  accepts_nested_attributes_for :tags

  POST_PRIVACY = {
    :public     => 0,
    :friends    => 1,
    :followers  => 2,
    :tagged     => 3
  }

  def self.dummyLocations(posts)
    posts.each do |post|
      post.lat = post.dummy_lat
      post.lon = post.dummy_lon
    end
  end

  def self.render_json_user(post)
    post.to_json(:include => :user)
  end

  def self.render_json_full(post)
    post.to_json(
      :include => [
        :user,
        {:comments  => {:include => :user}},
        {:likes     => {:include => :user}},
        {:tags      => {:include => :user}}
      ]
    )
  end

end
