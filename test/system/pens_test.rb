require "application_system_test_case"

class PensTest < ApplicationSystemTestCase
  setup do
    @pen = pens(:one)
  end

  test "visiting the index" do
    visit pens_url
    assert_selector "h1", text: "Pens"
  end

  test "should create pen" do
    visit pens_url
    click_on "New pen"

    fill_in "Description", with: @pen.description
    fill_in "Price", with: @pen.price
    fill_in "Title", with: @pen.title
    click_on "Create Pen"

    assert_text "Pen was successfully created"
    click_on "Back"
  end

  test "should update Pen" do
    visit pen_url(@pen)
    click_on "Edit this pen", match: :first

    fill_in "Description", with: @pen.description
    fill_in "Price", with: @pen.price
    fill_in "Title", with: @pen.title
    click_on "Update Pen"

    assert_text "Pen was successfully updated"
    click_on "Back"
  end

  test "should destroy Pen" do
    visit pen_url(@pen)
    click_on "Destroy this pen", match: :first

    assert_text "Pen was successfully destroyed"
  end
end
