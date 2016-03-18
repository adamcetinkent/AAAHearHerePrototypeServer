class LikesController < ApplicationController

  #def index
  #  @likes = Like.all
  #  render json: @likes.to_json(:include => [:user, :post])
  #end

  def create
    @like = Like.new(like_params)
    @deletedLikes = Like.with_deleted.where(post_id: @like.post_id, user_id: @like.user_id)
    if (@deletedLikes.blank?)
      puts 'NEW LIKE'
      if @like.save
        render json: @like.to_json( :include => :user )
      end
    else 
      puts 'RESTORE LIKE'
      deletedLike = @deletedLikes.take
      deletedLike.restore
      render json: deletedLike.to_json( :include => :user )
    end
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
