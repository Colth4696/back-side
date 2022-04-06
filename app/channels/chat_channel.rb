class ChatChannel < ApplicationCable::Channel
  def subscribed
    puts params.inspect
    puts "Colt"
    chatroom = Chatroom.find(params[:room])
    stream_for chatroom
   # stream_from "chat_#{params[:room]}"  
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
