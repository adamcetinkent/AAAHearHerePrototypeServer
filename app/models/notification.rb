class Notification < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :post
  belongs_to :by_user, :class_name => "User", :primary_key => "fb_user_id", :foreign_key => "by_fb_user_id" 
  belongs_to :for_user, :class_name => "User", :foreign_key => "for_user_id"

  NOTIFICATION_TYPE = {
    :new_post           => 0,
    :like_post          => 1,
    :new_comment        => 2,
    :new_follow         => 3,
    :new_follow_request => 4
  }

end
