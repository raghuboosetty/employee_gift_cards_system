require "application_system_test_case"

class CardTypesTest < ApplicationSystemTestCase
  setup do
    @card_type = card_types(:one)
  end

  test "visiting the index" do
    visit card_types_url
    assert_selector "h1", text: "Card Types"
  end

  test "creating a Card type" do
    visit card_types_url
    click_on "New Card Type"

    click_on "Create Card type"

    assert_text "Card type was successfully created"
    click_on "Back"
  end

  test "updating a Card type" do
    visit card_types_url
    click_on "Edit", match: :first

    click_on "Update Card type"

    assert_text "Card type was successfully updated"
    click_on "Back"
  end

  test "destroying a Card type" do
    visit card_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Card type was successfully destroyed"
  end
end
