class FlashCard < ApplicationRecord
  belongs_to :topic
  validates :difficulty,
            numericality: {
              greater_than_or_equal_to: 0,
              less_than_or_equal_to: 1.0
            }
end
