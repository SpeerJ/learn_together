require "application_system_test_case"

class FlashCardAnswersTest < ApplicationSystemTestCase
  setup do
    @flash_card_answer = flash_card_answers(:one)
  end

  test "visiting the index" do
    visit flash_card_answers_url
    assert_selector "h1", text: "Flash card answers"
  end

  test "should create flash card answer" do
    visit flash_card_answers_url
    click_on "New flash card answer"

    fill_in "Explanation", with: @flash_card_answer.explanation
    fill_in "Flash card", with: @flash_card_answer.flash_card_id
    fill_in "Value", with: @flash_card_answer.value
    click_on "Create Flash card answer"

    assert_text "Flash card answer was successfully created"
    click_on "Back"
  end

  test "should update Flash card answer" do
    visit flash_card_answer_url(@flash_card_answer)
    click_on "Edit this flash card answer", match: :first

    fill_in "Explanation", with: @flash_card_answer.explanation
    fill_in "Flash card", with: @flash_card_answer.flash_card_id
    fill_in "Value", with: @flash_card_answer.value
    click_on "Update Flash card answer"

    assert_text "Flash card answer was successfully updated"
    click_on "Back"
  end

  test "should destroy Flash card answer" do
    visit flash_card_answer_url(@flash_card_answer)
    click_on "Destroy this flash card answer", match: :first

    assert_text "Flash card answer was successfully destroyed"
  end
end
