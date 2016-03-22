class LikesController < ApplicationController

  def create
    like = Like.new(like_params)
    createdLike = Like.create_or_restore(like)
    render json: Like.render_json_user(like)
  end

  def delete
    if Like.with_deleted.find(params[:id]).destroy
      render :nothing => true, :status => 200
    else
      render :nothing => true, :status => 400
    end
  end

  private
  def like_params
    params.require(:like).permit(:post_id, :user_id)
  end

end
