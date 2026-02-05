require "application_system_test_case"

class InksTest < ApplicationSystemTestCase
  setup do
    @ink = inks(:one)
    @user = users(:one)
  end

  test "visiting the index" do
    visit inks_url
    assert_selector "h1", text: "My Ink Collection"
  end

  test "viewing an ink" do
    visit inks_url
    click_on "View", match: :first

    assert_selector ".ink-show-title", text: @ink.name
  end

  test "searching for an ink" do
    visit inks_url
    fill_in "query", with: "Pilot"
    click_on "Search"

    assert_text "Iroshizuku Kon-Peki"
    assert_no_text "Oxblood"
  end
end
