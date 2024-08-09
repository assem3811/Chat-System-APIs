class Message < ApplicationRecord
  belongs_to :chat, counter_cache: true
  validates :number, uniqueness: { scope: :chat_id }

  before_create :assign_message_number

  private
  
  def assign_message_number
    self.number = chat.messages.maximum(:number).to_i + 1
  end
end
