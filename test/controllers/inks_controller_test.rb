require "test_helper"

class InksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ink = inks(:one)
    @user = users(:one)
  end

  # Public access (no auth required)

  test "should get index" do
    get inks_url
    assert_response :success
  end

  test "should show ink" do
    get ink_url(@ink)
    assert_response :success
  end

  test "index should include ink name" do
    get inks_url
    assert_match @ink.name, response.body
  end

  test "index should support search" do
    get inks_url, params: { query: "Pilot" }
    assert_response :success
    assert_match "Pilot", response.body
  end

  # Auth required - redirects when not signed in

  test "should redirect new when not signed in" do
    get new_ink_url
    assert_redirected_to new_session_url
  end

  test "should redirect create when not signed in" do
    post inks_url, params: { ink: { name: "Test", brand: "Brand", color: "Blue", price: 10 } }
    assert_redirected_to new_session_url
  end

  test "should redirect edit when not signed in" do
    get edit_ink_url(@ink)
    assert_redirected_to new_session_url
  end

  test "should redirect update when not signed in" do
    patch ink_url(@ink), params: { ink: { name: "Updated" } }
    assert_redirected_to new_session_url
  end

  test "should redirect destroy when not signed in" do
    delete ink_url(@ink)
    assert_redirected_to new_session_url
  end

  # Authenticated access

  test "should get new when signed in" do
    sign_in @user
    get new_ink_url
    assert_response :success
  end

  test "should create ink when signed in" do
    sign_in @user
    assert_difference("Ink.count") do
      post inks_url, params: { ink: { name: "New Ink", brand: "Pilot", color: "Blue", description: "A great ink", price: 19.99 } }
    end
    assert_redirected_to ink_url(Ink.last)
  end

  test "should not create ink with invalid data" do
    sign_in @user
    assert_no_difference("Ink.count") do
      post inks_url, params: { ink: { description: "Missing required fields", price: 0 } }
    end
    assert_response :unprocessable_entity
  end

  test "should get edit when signed in" do
    sign_in @user
    get edit_ink_url(@ink)
    assert_response :success
  end

  test "should update ink when signed in" do
    sign_in @user
    patch ink_url(@ink), params: { ink: { name: "Updated Name" } }
    assert_redirected_to ink_url(@ink)
    @ink.reload
    assert_equal "Updated Name", @ink.name
  end

  test "should destroy ink when signed in" do
    sign_in @user
    assert_difference("Ink.count", -1) do
      delete ink_url(@ink)
    end
    assert_redirected_to inks_url
  end
end
