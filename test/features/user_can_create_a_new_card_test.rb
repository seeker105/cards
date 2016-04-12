require 'test_helper.rb'

class UserCanCreateANewCardTest < ActionDispatch::IntegrationTest

  def test_user_can_return_to_index_without_creating_a_card
    visit cards_path

    click_on "Create New Card"

    assert_equal new_card_path, current_path
    assert page.has_link?("Main Index")

    click_on "Main Index"

    assert_equal cards_path, current_path
  end

  def test_it_creates_a_new_card
    original_count = Card.count

    visit cards_path

    card_name = "Nightshade"
    card_value = 3

    click_on "Create New Card"
    fill_in "card_name", with: card_name
    fill_in "card_value", with: card_value
    click_on "Create Card"

    assert Card.count == original_count + 1
    assert page.has_content?(card_name)
    assert page.has_content?(card_value)
    assert page.has_link?("Main Index")

    click_on "Main Index"

    assert_equal cards_path, current_path
  end



end
