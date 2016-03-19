class FollowsController < ApplicationController

  def delete 
    if Follow.with_deleted.find(params[:id]).destroy
      render :nothing => true, :status => 200
    else
      render :nothing => true, :status => 400
    end
  end

end
