  class CreateMessageJob < ApplicationJob
    queue_as :default
  
    def perform(chat_id, body)
      chat = Chat.find(chat_id)
      chat.messages.create!(body: body)
    end
  end