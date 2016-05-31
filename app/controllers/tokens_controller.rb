class TokensController < ApplicationController
  before_action :get_token

  def validate

    #token = Token.new(token_params)
    
    #puts "TOKEN: "+@token

    url = "https://graph.facebook.com/debug_token?input_token="+@token+"&access_token=966494340087272|tmC_hhzPVAOyVxYby-anwUrYwW8"

    #puts url

    uri = URI(url)
    fbResponse = Net::HTTP.get_response(uri)

    #puts response.code

    case fbResponse
    when Net::HTTPSuccess then
      #puts response.body
      
      data = ActiveSupport::JSON.decode(fbResponse.body)

      if data['data']['is_valid']
        found_fb_user_id = data['data']['user_id']
        #puts "USER ID: " + found_fb_user_id

        user = User.find_by fb_user_id: found_fb_user_id

        #puts user.to_json

        if user.present?

          urlFriends = "https://graph.facebook.com/v2.5/me/friends?access_token="+@token
          #puts "---GETTING FRIENDS---"
          #puts urlFriends
          uriFriends = URI(urlFriends)
          responseFriends = Net::HTTP.get_response(uriFriends)
          #puts responseFriends.code
          case responseFriends
          when Net::HTTPSuccess then
            dataFriends = ActiveSupport::JSON.decode(responseFriends.body)
            #puts dataFriends
            Friendship.process_friends(dataFriends, user)
          else
            puts "ERROR GETTING FRIENDS"
          end

          notifications = Notification.where(for_user_id: user.id, read_at: nil)
                                      .where('notification_type != 5')
          notifications.each do |n|
            n.sent_at = nil
            n.save
          end

          if (user.new_auth_token)
            response.headers["Authorization"] = user.auth_token
            render json: User.render_to_json_full(user)
          else
            render :nothing => true, :status => 401
          end
        
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
  #def token_params
  #  params.permit(:expires, :token, :applicationId, :userId)
  #end

  def get_token
    authenticate_with_http_token do |token, options|
      @token = token
    end
  end

end
