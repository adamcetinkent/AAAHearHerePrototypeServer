class Friendship < ActiveRecord::Base

  belongs_to :user
  has_one :friend_user, :class_name => "User", :primary_key => "friend_user_id", :foreign_key => "id"

end
