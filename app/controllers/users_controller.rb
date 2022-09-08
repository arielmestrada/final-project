class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @users = User.where(admin: false).order('banned DESC')
  end

  def update
    respond_to do |format|
      @user = User.find(params[:id])
      if @user.banned?
        @user.update(banned: false)
      else
        @user.update(banned: true)
      end
      format.html { redirect_to users_path }
    end
  end

  def show
    # shows profile
  end

  def message
    @user = User.find(params[:id])
    @users = User.where(id: current_user.friends.map { |f| f.friend_id })

    @channel = Channel.new
    @channels = Channel.group_channels
    @channel_name = get_name(@user, current_user)
    @single_channel = Channel.where(name: @channel_name).first || Channel.create_private_channel(
      [@user, current_user], @channel_name
    )

    @message = Message.new
    @messages = @single_channel.messages.order(created_at: :asc)
    render 'channels/index'
  end

  private

  def get_name(user1, user2)
    user = [user1, user2].sort
    "private_#{user[0].id}_#{user[1].id}"
  end
end
