require "application_system_test_case"

class PensTest < ApplicationSystemTestCase
  setup do
    @pen = pens(:one)
    @user = users(:one)
  end

  test "visiting the index" do
    visit pens_url
    assert_selector "h1", text: "My Fountain Pen Collection"
  end

  test "viewing a pen" do
    visit pens_url
    click_on "View", match: :first

    assert_selector ".pen-show-title", text: @pen.title
  end

  test "searching for a pen" do
    visit pens_url
    fill_in "query", with: "Pilot"
    click_on "Search"

    assert_text "Pilot Metropolitan"
    assert_no_text "LAMY Safari"
  end
end
