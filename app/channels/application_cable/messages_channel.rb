class MessagesChannel < ApplicationCable::Channel
    def subscribed
      chat = Chat.find(params[:id])
      stream_for chatroom
    end
  
    def unsubscribed
    end
  end