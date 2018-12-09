require 'test_helper'

class CardTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card_type = card_types(:one)
  end

  test "should get index" do
    get card_types_url
    assert_response :success
  end

  test "should get new" do
    get new_card_type_url
    assert_response :success
  end

  test "should create card_type" do
    assert_difference('CardType.count') do
      post card_types_url, params: { card_type: {  } }
    end

    assert_redirected_to card_type_url(CardType.last)
  end

  test "should show card_type" do
    get card_type_url(@card_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_card_type_url(@card_type)
    assert_response :success
  end

  test "should update card_type" do
    patch card_type_url(@card_type), params: { card_type: {  } }
    assert_redirected_to card_type_url(@card_type)
  end

  test "should destroy card_type" do
    assert_difference('CardType.count', -1) do
      delete card_type_url(@card_type)
    end

    assert_redirected_to card_types_url
  end
end
