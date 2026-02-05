require "test_helper"

class InkTest < ActiveSupport::TestCase
  test "valid ink with all attributes" do
    ink = Ink.new(name: "Test Ink", brand: "Test Brand", color: "Blue", price: 19.99, description: "A fine ink")
    assert ink.valid?
  end

  test "invalid without name" do
    ink = Ink.new(brand: "Brand", color: "Blue", price: 19.99)
    assert_not ink.valid?
    assert_includes ink.errors[:name], "can't be blank"
  end

  test "invalid without brand" do
    ink = Ink.new(name: "Test Ink", color: "Blue", price: 19.99)
    assert_not ink.valid?
    assert_includes ink.errors[:brand], "can't be blank"
  end

  test "invalid without color" do
    ink = Ink.new(name: "Test Ink", brand: "Brand", price: 19.99)
    assert_not ink.valid?
    assert_includes ink.errors[:color], "can't be blank"
  end

  test "invalid without price" do
    ink = Ink.new(name: "Test Ink", brand: "Brand", color: "Blue")
    assert_not ink.valid?
    assert_includes ink.errors[:price], "can't be blank"
  end

  test "invalid with non-numeric price" do
    ink = Ink.new(name: "Test Ink", brand: "Brand", color: "Blue", price: "not a number")
    assert_not ink.valid?
    assert_includes ink.errors[:price], "is not a number"
  end

  test "invalid with zero price" do
    ink = Ink.new(name: "Test Ink", brand: "Brand", color: "Blue", price: 0)
    assert_not ink.valid?
    assert_includes ink.errors[:price], "must be greater than 0"
  end

  test "invalid with negative price" do
    ink = Ink.new(name: "Test Ink", brand: "Brand", color: "Blue", price: -5)
    assert_not ink.valid?
    assert_includes ink.errors[:price], "must be greater than 0"
  end

  test "valid without description" do
    ink = Ink.new(name: "Test Ink", brand: "Brand", color: "Blue", price: 19.99)
    assert ink.valid?
  end

  test "search scope finds inks by name" do
    inks = Ink.search("Kon-Peki")
    assert_includes inks, inks(:one)
    assert_not_includes inks, inks(:two)
  end

  test "search scope finds inks by brand" do
    inks = Ink.search("Diamine")
    assert_includes inks, inks(:two)
    assert_not_includes inks, inks(:one)
  end

  test "search scope finds inks by color" do
    inks = Ink.search("Orange")
    assert_includes inks, inks(:three)
    assert_not_includes inks, inks(:one)
  end

  test "search scope returns all inks when query is blank" do
    assert_equal Ink.all.count, Ink.search("").count
    assert_equal Ink.all.count, Ink.search(nil).count
  end

  test "recent scope orders by newest first" do
    inks = Ink.recent
    assert inks.first.created_at >= inks.last.created_at
  end
end
