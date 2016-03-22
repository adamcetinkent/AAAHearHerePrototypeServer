class Like < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :post
  belongs_to :user

  def self.create_or_restore(like)
    deletedLike = Like.with_deleted.where(post_id: like.post_id, user_id: like.user_id).take
    if deletedLike.blank?
      puts 'NEW LIKE'
      if like.save
        like
      end
    else
      puts 'RESTORE LIKE'
      if deletedLike.restore
        deletedLike
      end
    end
  end

  def self.render_json_user(like)
    like.to_json(:include => :user)
  end

end
