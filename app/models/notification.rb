class Notification < ActiveRecord::Base
  acts_as_paranoid

  NOTIFICATION_TYPE = {
    :new_post     => 0,
    :like_post    => 1,
    :new_comment  => 2,
    :new_follow   => 3
  }

end
