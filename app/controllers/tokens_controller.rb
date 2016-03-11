#require 'httparty'

class TokensController < ApplicationController
  #include HTTParty

  def validate

    @token = Token.new(token_params)
    
    url = "https://graph.facebook.com/debug_token?input_token="+@token.token+"&access_token=966494340087272|tmC_hhzPVAOyVxYby-anwUrYwW8"
    #url = "https://graph.facebook.com/debug_token?input_token="+@token.token+"&access_token=966494340087272|tmC_hhzPVAOyVxYby-anwUrYwW"

    puts url

    uri = URI(url)
    response = Net::HTTP.get_response(uri)

    puts response.code

    case response
    when Net::HTTPSuccess then
      puts response.body
      
      data = ActiveSupport::JSON.decode(response.body)

      valid = data['data']['is_valid'] 
      strValid = valid ? "true" : "false"
      puts "VALID: " + strValid

      if valid
        found_fb_user_id = data['data']['user_id']
        puts "USER ID: " + found_fb_user_id

        @user = User.find_by fb_user_id: found_fb_user_id

        puts @user.to_json

        if @user.present?

          urlFriends = "https://graph.facebook.com/v2.5/me/friends?access_token="+@token.token
          puts "---GETTING FRIENDS---"
          puts urlFriends
          uriFriends = URI(urlFriends)
          responseFriends = Net::HTTP.get_response(uriFriends)
          puts responseFriends.code
          case responseFriends
          when Net::HTTPSuccess then
             dataFriends = ActiveSupport::JSON.decode(responseFriends.body)
             #puts "FRIENDS RESPONSE: "
	     dataFriends['data'].each do |item|
               #puts "->"
               #puts item['id']
               friendship = Friendship.new
               friendship.user_id = @user.id
               @friend_user = User.where(fb_user_id: item['id'])
               if @friend_user.blank?
                 puts "Friend with id not found!"
               else
                 found_friend = @friend_user.take
                 friendship.friend_user_id = found_friend.id
                 puts friendship.to_json
                 @friendships = Friendship.find_by(friend_user_id: friendship.friend_user_id, user_id: friendship.user_id)
                 if @friendships.present?
                    puts "FRIENDSHIP ALREADY EXISTS"
                 else
	            friendship.save
                 end
               end
             end
          else
             puts "ERROR GETTING FRIENDS"
          end          

          render json: @user.to_json(:include => {:friendships => {:include => :friend_user } } )
        else
          puts "NEW USER DETECTED!"
          render :nothing => true, :status => 202
        end

      else
        render :nothing => true, :status => 401
      end

    else
      render :nothing => true, :status => 400
    end

  end

  private
  def token_params
    params.permit(:expires, :token, :applicationId, :userId)
  end

end
