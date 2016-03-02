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
          render json: @user
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
