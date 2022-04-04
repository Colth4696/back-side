class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream from "chat_#{params[:id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
