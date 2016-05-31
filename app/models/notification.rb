class Notification < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :post
  belongs_to :by_user, :class_name => "User", :foreign_key => "by_user_id" 
  belongs_to :for_user, :class_name => "User", :foreign_key => "for_user_id"

  NOTIFICATION_TYPE = {
    :new_post           => 0,
    :like_post          => 1,
    :new_comment        => 2,
    :new_follow         => 3,
    :new_follow_request => 4,
    :post_location      => 5
  }

  def self.render_json_full(notification)
    notification.to_json(
      :include => [
        :by_user,
        :for_user,
        :post
      ]
    )
  end

end
