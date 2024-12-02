module FlashCardsHelper
  def hidden_answer_flash_card_path(flash_card)
    flash_card_path(flash_card || @flash_card)
  end
end
