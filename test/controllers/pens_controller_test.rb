require "test_helper"

class PensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pen = pens(:one)
    @user = users(:one)
  end

  # Public access (no auth required)

  test "should get index" do
    get pens_url
    assert_response :success
  end

  test "should show pen" do
    get pen_url(@pen)
    assert_response :success
  end

  test "index should include pen title" do
    get pens_url
    assert_match @pen.title, response.body
  end

  test "index should support search" do
    get pens_url, params: { query: "Pilot" }
    assert_response :success
    assert_match "Pilot", response.body
  end

  # Auth required - redirects when not signed in

  test "should redirect new when not signed in" do
    get new_pen_url
    assert_redirected_to new_session_url
  end

  test "should redirect create when not signed in" do
    post pens_url, params: { pen: { title: "Test", price: 10 } }
    assert_redirected_to new_session_url
  end

  test "should redirect edit when not signed in" do
    get edit_pen_url(@pen)
    assert_redirected_to new_session_url
  end

  test "should redirect update when not signed in" do
    patch pen_url(@pen), params: { pen: { title: "Updated" } }
    assert_redirected_to new_session_url
  end

  test "should redirect destroy when not signed in" do
    delete pen_url(@pen)
    assert_redirected_to new_session_url
  end

  # Authenticated access

  test "should get new when signed in" do
    sign_in @user
    get new_pen_url
    assert_response :success
  end

  test "should create pen when signed in" do
    sign_in @user
    assert_difference("Pen.count") do
      post pens_url, params: { pen: { description: "A great pen", price: 19.99, title: "New Test Pen" } }
    end
    assert_redirected_to pen_url(Pen.last)
  end

  test "should not create pen with invalid data" do
    sign_in @user
    assert_no_difference("Pen.count") do
      post pens_url, params: { pen: { description: "Missing title", price: 0 } }
    end
    assert_response :unprocessable_entity
  end

  test "should get edit when signed in" do
    sign_in @user
    get edit_pen_url(@pen)
    assert_response :success
  end

  test "should update pen when signed in" do
    sign_in @user
    patch pen_url(@pen), params: { pen: { title: "Updated Title" } }
    assert_redirected_to pen_url(@pen)
    @pen.reload
    assert_equal "Updated Title", @pen.title
  end

  test "should destroy pen when signed in" do
    sign_in @user
    assert_difference("Pen.count", -1) do
      delete pen_url(@pen)
    end
    assert_redirected_to pens_url
  end
end
