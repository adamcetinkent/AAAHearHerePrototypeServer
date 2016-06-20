class Mute < ActiveRecord::Base
  acts_as_paranoid
  belongs_to  :user
  has_one     :post
  
  def self.create_or_restore(mute)
    deletedMute = Mute.with_deleted.where(post_id: mute.post_id, user_id: mute.user_id).take
    if deletedMute.blank?
      puts 'NEW MUTE'
      if mute.save
        mute
      end
    else
      puts 'RESTORE MUTE'
      if deletedMute.restore
        deletedMute
      end
    end
  end

end
