class Application < ApplicationRecord
    has_many :chats, dependent: :destroy
    validates :name, presence: true
    validates :token, uniqueness: true

    before_create :generate_token

    #The token generator function...
    private

    def generate_token
        self.token = SecureRandom.hex(20)
    end
end
