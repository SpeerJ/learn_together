require "test_helper"

class FlashCardAnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @flash_card_answer = flash_card_answers(:one)
  end

  test "should get index" do
    get flash_card_answers_url
    assert_response :success
  end

  test "should get new" do
    get new_flash_card_answer_url
    assert_response :success
  end

  test "should create flash_card_answer" do
    assert_difference("FlashCardAnswer.count") do
      post flash_card_answers_url, params: { flash_card_answer: { explanation: @flash_card_answer.explanation, flash_card_id: @flash_card_answer.flash_card_id, value: @flash_card_answer.value } }
    end

    assert_redirected_to flash_card_answer_url(FlashCardAnswer.last)
  end

  test "should show flash_card_answer" do
    get flash_card_answer_url(@flash_card_answer)
    assert_response :success
  end

  test "should get edit" do
    get edit_flash_card_answer_url(@flash_card_answer)
    assert_response :success
  end

  test "should update flash_card_answer" do
    patch flash_card_answer_url(@flash_card_answer), params: { flash_card_answer: { explanation: @flash_card_answer.explanation, flash_card_id: @flash_card_answer.flash_card_id, value: @flash_card_answer.value } }
    assert_redirected_to flash_card_answer_url(@flash_card_answer)
  end

  test "should destroy flash_card_answer" do
    assert_difference("FlashCardAnswer.count", -1) do
      delete flash_card_answer_url(@flash_card_answer)
    end

    assert_redirected_to flash_card_answers_url
  end
end
