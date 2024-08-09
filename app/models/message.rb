class Message < ApplicationRecord

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :chat, counter_cache: true
  validates :number, uniqueness: { scope: :chat_id }

  before_create :assign_message_number

  after_commit on: [:create] do
    unless Message.__elasticsearch__.index_exists?
      Message.__elasticsearch__.create_index!(force: true)
    end
  end

  private
  
  def assign_message_number
    self.number = chat.messages.maximum(:number).to_i + 1
  end
end
