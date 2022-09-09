class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :read
  # root path
  def dashboard
    @users = User.all
    @user = current_user.id
    
    @posts = Post.all.order(created_at: :desc)

    @comment = Comment.new
  end

  def view_profile
    @friend = view_context.friend(params[:id].to_i)
    @profile = User.find(params[:id]) if params[:id].present?
    request = view_context.find_friend(@profile)
    @request = view_context.find_friend(@profile) unless request.nil?
    @user_preferences = view_context.get_user_preferences(@profile)
  end

  def search_friends
    @friends = view_context.all_friends
    @friends = @friends.select { |item| item[:email].include? "#{params[:username].downcase}" }
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update('search_friends_results', partial: 'friends/search_results',
                                                                           locals: { users: @friends })
      end
    end
  end

  def view_friends
    @friends = view_context.all_friends(current_user.id)
  end

  private
  
  def read
    authorize! :read, current_user, message: 'Banned' if current_user.banned?
  end
end
