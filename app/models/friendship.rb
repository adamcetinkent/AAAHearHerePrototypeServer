class Friendship < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :user
  has_one :friend_user, :class_name => "User", :primary_key => "friend_user_id", :foreign_key => "id"

  def self.process_friends(dataFriends, user)
	  puts dataFriends['data']
    dataFriends['data'].each do |item|
      friendship = Friendship.new
      friendship.user_id = user.id
      friend_user = User.where(fb_user_id: item['id'])
      if friend_user.blank?
        puts "Friend with id not found!"
      else
        found_friend = friend_user.take
        friendship.friend_user_id = found_friend.id
        puts friendship.to_json
        friendships = Friendship.find_by(friend_user_id: friendship.friend_user_id, user_id: friendship.user_id)
        if friendships.present?
          puts "FRIENDSHIP ALREADY EXISTS"
        else
          friendship.save
        end
      end
    end
  end

end
