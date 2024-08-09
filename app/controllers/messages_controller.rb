class MessagesController < ApplicationController

    #Get all messages in a chat in a specific app
    def index
        @application = Application.find_by!(token: params[:application_token])
        @chat = @application.chats.find_by!(number: params[:chat_number])
        @messages = @chat.messages
        render json: @messages
    end

    #Get a message by its number
    def show
        @application = Application.find_by!(token: params[:application_token])
        @chat = @application.chats.find_by!(number: params[:chat_number])
        @message = @chat.messages.find_by!(number: params[:number])
        render json: @message
    end

    #Create a message for a specific chat in a specific app
    def create
        @application = Application.find_by!(token: params[:application_token])
        @chat = @application.chats.find_by!(number: params[:chat_number])
        @message = @chat.messages.new(message_params)

        if @message.save
            render json: { number: @message.number }, status: :created
        else
            render json: @message.errors, status: :unprocessable_entity
        end
    end

    def update
        @application = Application.find_by!(token: params[:application_token])
        @chat = @application.chats.find_by!(number: params[:chat_number])
        @message = @chat.messages.find_by!(number: params[:number])
        if @message.update(message_params)
          render json: @message
        else
          render json: @message.errors, status: :unprocessable_entity
        end
    end

    #Delete a message
    def destroy
        @application = Application.find_by!(token: params[:application_token])
        @chat = @application.chats.find_by!(number: params[:chat_number])
        @message = @chat.messages.find_by!(number: params[:number])
        @message.destroy
        #head :no_content
        render json: { message: "Message deleted" }
    end

    private

    def message_params
        params.require(:message).permit(:body)
    end
end
