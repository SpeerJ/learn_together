class CardAttempt < ApplicationRecord
  belongs_to :flash_card
  belongs_to :user
end
