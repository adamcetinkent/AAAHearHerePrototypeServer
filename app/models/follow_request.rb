class FollowRequest < ActiveRecord::Base
  acts_as_paranoid
  
  belongs_to :user
  has_one :requested_user, :class_name => "User", :primary_key => "requested_user_id", :foreign_key => "id"

  def self.createOrRestore(request)
    deletedRequest = FollowRequest.with_deleted.where(user_id: request.user_id, requested_user_id: request.requested_user_id).take
    if deletedRequest.blank?
      puts 'NEW REQUEST'
      if request.save
        request
      end
    else
      puts 'RESTORE REQUEST'
      if deletedRequest.restore
        deletedRequest
      end
    end
  end

end
