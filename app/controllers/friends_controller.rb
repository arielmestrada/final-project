class FriendsController < ApplicationController
  def index
    @users = view_context.show_user(params[:username]) if params[:username].present?
  end

  def create
    user = view_context.check_if_user_valid(params[:username])
    respond_to do |format|
      if user.nil?
        format.html { redirect_to friends_path, notice: 'User not found' }
      else
        format.html { redirect_to friends_path(username: params[:username]) }
      end
    end
  end

  def add_friend
    respond_to do |format|
      @user = User.find(params[:id])
      view_context.add_friend(@user)
      format.turbo_stream
      format.html { redirect_to dashboard_path, notice: 'Request sent!' }
    end
  end

  def decline
    respond_to do |format|
      view_context.decline(params[:id].to_i)
      format.html { redirect_to view_profile_path(params[:id]), notice: 'Request decline' }
    end
  end

  def accept
    respond_to do |format|
      view_context.accept(params[:id].to_i)
      format.html { redirect_to view_profile_path(params[:id]), notice: 'Successfully added to friends' }
    end
  end
end
