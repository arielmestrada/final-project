class FriendsController < ApplicationController
  def index; end

  def create
    @users = view_context.show_user(params[:username])
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update('search_results', partial: 'friends/search_results',
                                                                   locals: { users: @users })
      end
    end
  end

  def add_friend
    respond_to do |format|
      @user = User.find(params[:id])
      view_context.add_friend(@user)
      format.html { redirect_to view_profile_path(params[:id]), success: 'Request sent!' }
      format.turbo_stream do
        render turbo_stream: turbo_stream.update('request')
      end
    end
  end

  def decline
    respond_to do |format|
      view_context.decline(params[:id].to_i)
      format.html { redirect_to view_profile_path(params[:id]), alert: 'Request denied' }
    end
  end

  def accept
    respond_to do |format|
      view_context.accept(params[:id].to_i)
      format.html { redirect_to view_profile_path(params[:id]), success: 'Successfully added to friends' }
    end
  end

  def unfriend
    respond_to do |format|
      view_context.unfriend(params[:id])
      format.html { redirect_to view_profile_path(params[:id]), alert: 'Unfriended' }
    end
  end
end
