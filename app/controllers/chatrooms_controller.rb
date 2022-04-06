class ChatroomsController < ApplicationController
  def index 
    @chatrooms = Chatroom.all
      if @chatrooms
        render json: {
          chatrooms: @chatrooms
        }
      end
    end

  def create
    chatroom = Chatroom.new(chatroom_params)
      if chatroom.save
        serialized_data = ActiveModelSerializers::Adapter::Json.new(
        ChatroomSerializer.new(chatroom)
        ).serializable_hash
    # ActionCable.server.broadcast 'chatrooms_channel', serialized_data
    render json: {
      chatroom: chatroom}
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
        if @chatroom
           render json: {
           chatroom: @chatroom
        }
        else
           render json: {
           status: 500,
           errors: ['chatroom not found']
         }
        end
end
      
      private
      
      def chatroom_params
        params.require(:chatroom).permit(:name, :request_id, :volunteer_id)
      end
end

