class Topic < ApplicationRecord
  belongs_to :subject
  has_many :flash_cards
end
