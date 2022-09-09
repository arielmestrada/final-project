class ChannelsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat_var, only: %i[ index show ]  

  def index
    render :index
  end
  
  def show
    @single_channel = Channel.find(params[:id])
    @message = Message.new
    @messages = @single_channel.messages.order(created_at: :asc)
    render :index
  end

  def create
    @channel = Channel.create(channel_params)
  end

  private  

  def channel_params
    params.require(:channel).permit(:name)
  end

  def set_chat_var
    @channel = Channel.new
    @channels = Channel.group_channels
    @pref_channels = Channel.where(name: current_user.user_preferences)
    @users = User.where(id: current_user.friends.map do |f| f.friend_id end )
    @all_known_ids = current_user.friends.map do |f| f.friend_id end
    @all_known_ids << current_user.id
    @all_users = User.where.not( id: @all_known_ids )
  end
end
