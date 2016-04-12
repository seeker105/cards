class UserCanViewAllCardsTest < ActionDispatch::IntegrationTest

  def setup
    @card1 = Card.create(name: "card 1", value: 1)
    @card2 = Card.create(name: "card 2", value: 2)
    @card3 = Card.create(name: "card 3", value: 3)
  end

  def test_it_opens_the_index_page
    path = cards_path
    visit cards_path

    assert_equal path, current_path
    # byebug

    assert page.has_content?("Card List"), "Text 'Card List' did not display"
    # save_and_open_page
    assert page.has_content?(@card1.name), "card1 name did not display"
    assert page.has_content?(@card2.name), "card2 name did not display"
    assert page.has_content?(@card3.name), "card3 name did not display"

    assert page.has_link?("Create New Card"), "Create new card link did not display"

  end

end
