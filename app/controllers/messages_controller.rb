class MessagesController < ApplicationController
    def index
        messages = Message.all
        render json: messages
      end
    def create
        @message = Message.new(message_params)
        if @message.save
            serialized_data = ActiveModelSerializers::Adapter::Json.new(
            MessageSerializer.new(message)
            ).serializable_hash
            MessagesChannel.broadcast_to chatroom, serialized_data
            head :ok
        else
            render json: message.errors.full_messages
        end
    end
        def show
            @message = Message.find(params[:id])
                if @message
                   render json: {
                   message: @message
                }
                else
                   render json: {
                   status: 500,
                   errors: ['message not found']
                 }
                end
    end
    
    private
    
    def message_params
        params.require(:message).permit(:body, :chatroom_id, :user_id)
    end
  end
  
