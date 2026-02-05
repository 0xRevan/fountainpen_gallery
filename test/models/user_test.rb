require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "valid user" do
    user = User.new(email_address: "test@example.com", password: "password123")
    assert user.valid?
  end

  test "invalid without email" do
    user = User.new(password: "password123")
    assert_not user.valid?
    assert_includes user.errors[:email_address], "can't be blank"
  end

  test "invalid with duplicate email" do
    User.create!(email_address: "dupe@example.com", password: "password123")
    user = User.new(email_address: "dupe@example.com", password: "password123")
    assert_not user.valid?
    assert_includes user.errors[:email_address], "has already been taken"
  end

  test "normalizes email address" do
    user = User.new(email_address: "  TEST@Example.COM  ", password: "password123")
    user.valid?
    assert_equal "test@example.com", user.email_address
  end

  test "invalid without password" do
    user = User.new(email_address: "test@example.com")
    assert_not user.valid?
    assert_includes user.errors[:password], "can't be blank"
  end
end
