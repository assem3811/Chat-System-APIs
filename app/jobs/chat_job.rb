class CreateChatJob < ApplicationJob
    queue_as :default
  
    def perform(application_id)
      application = Application.find(application_id)
      application.chats.create!
    end
  end
  