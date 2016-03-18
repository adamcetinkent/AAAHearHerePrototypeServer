class Follow < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :user
  has_one :followed_user, :class_name => "User", :primary_key => "followed_user_id", :foreign_key => "id"

end
