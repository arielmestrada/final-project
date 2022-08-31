class MessagesController < ApplicationController
    before_action :authenticate_user!
    def create
        @message = current_user.messages.create(body: message_params[:body], channel_id: params[:channel_id])
    end

    private

    def message_params
        params.require(:message).permit(:body)
    end
end
