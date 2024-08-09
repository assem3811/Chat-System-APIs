class Chat < ApplicationRecord
  belongs_to :application, counter_cache: true
  has_many :messages, dependent: :destroy
  validates :number, uniqueness: { scope: :application_id }

  before_create :assign_chat_number

  #The function to assign the chat number 
  def assign_chat_number
    self.number = application.chats.maximum(:number).to_i + 1;
  end
end
