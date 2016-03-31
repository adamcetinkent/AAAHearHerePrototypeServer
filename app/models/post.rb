class Post < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :tags
#  has_many :tagged_users, through: :tags, :class_name => "User"

  accepts_nested_attributes_for :tags

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
