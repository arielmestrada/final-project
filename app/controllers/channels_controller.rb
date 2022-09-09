class ChannelsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat_var, only: %i[ index show ]
  before_action :create_channels

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

  def create_channels
    return unless Channel.all.empty?
    Breed.all.each do |breed|
      Channel.create(name: breed.name)
    end
  end

  def channel_params
    params.require(:channel).permit(:name)
  end

  def set_chat_var
    @channel = Channel.new
    @channels = Channel.group_channels
    @users = User.where(id: current_user.friends.map do |f| f.friend_id end )
    @all_users = User.all_except(current_user)
  end
end
