class Follow < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :user
  has_one :followed_user, :class_name => "User", :primary_key => "followed_user_id", :foreign_key => "id"

  def self.createOrRestore(follow)
    deletedFollow = Follow.with_deleted.where(user_id: follow.user_id, followed_user_id: follow.followed_user_id).take
    if deletedFollow.blank?
      puts 'NEW FOLLOW'
      if follow.save
        follow
      end
    else
      puts 'RESTORE FOLLOW'
      if deletedFollow.restore
        deletedFollow
      end
    end
  end

end
