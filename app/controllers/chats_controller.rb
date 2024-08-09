class ChatsController < ApplicationController

    #Get all chats of a specific app
    def index
        @application = Application.find_by!(token: params[:application_token])
        @chats = @application.chats
        render json: @chats
    end

    #Get a chat by a number
    def show
        @application = Application.find_by!(token: params[:application_token])
        @chat = @application.chats.find_by!(number: params[:number])
        render json: @chat
    rescue ActiveRecord::RecordNotFound
        render json: { error: "Chat not found" }, status: :not_found
    end
    
    #Create a new chat
    def create
        @application = Application.find_by!(token: params[:application_token])
        @chat = @application.chats.new

        if @chat.save
            render json: { number: @chat.number }, status: :created
        else
            render json @chat.errors, status: :unprocessable_entity
        end
    end

    #delete a chat...
    def destroy
        @application = Application.find_by!(token: params[:application_token])
        @chat = @application.chats.find_by!(number: params[:number])
        @chat.destroy
        #head :no_content
        render json: { message: "Chat deleted" }
    end
    
    private
    
    def chat_params
        params.require(:chat).permit(:number)
    end
end
