class FollowRequest < ActiveRecord::Base
  acts_as_paranoid
  
  belongs_to :user
  has_one :requested_user, :class_name => "User", :primary_key => "requested_user_id", :foreign_key => "id"

end
