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
    @profile = User.find(params[:id])
    view_context.add_friend_request(@profile)
  end

  def decline
    view_context.decline(params[:id].to_i)
  end

  def accept
    view_context.accept(params[:id].to_i)
  end

  def unfriend
    view_context.unfriend(params[:id])
  end
end
