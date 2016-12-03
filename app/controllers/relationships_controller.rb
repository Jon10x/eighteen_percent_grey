# https://www.devwalks.com/lets-build-instagram-with-ruby-on-rails-part-6-follow-all-the-people/

class RelationshipsController < ApplicationController
  def follow_user
    @user = User.find_by! user_name: params[:user_name]
    if current_user.follow @user.id
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js {render :layout=>false}
      end
    end
  end

  def unfollow_user
    @user = User.find_by! user_name: params[:user_name]
    if current_user.unfollow @user.id
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js {render :layout=>false} 
      end
    end
  end
end
