class MessagesController < ApplicationController
    before_action :authenticate_user!
    before_action :read
    
    def create
        @message = current_user.messages.create(body: message_params[:body], channel_id: params[:channel_id])
    end

    private

    def message_params
        params.require(:message).permit(:body)
    end

    def read
        authorize! :read, current_user, message: 'Banned' if current_user.banned?
      end
end
