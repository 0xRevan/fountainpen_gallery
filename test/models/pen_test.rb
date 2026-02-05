require "test_helper"

class PenTest < ActiveSupport::TestCase
  test "valid pen with all attributes" do
    pen = Pen.new(title: "Test Pen", price: 19.99, description: "A fine pen")
    assert pen.valid?
  end

  test "invalid without title" do
    pen = Pen.new(price: 19.99)
    assert_not pen.valid?
    assert_includes pen.errors[:title], "can't be blank"
  end

  test "invalid without price" do
    pen = Pen.new(title: "Test Pen")
    assert_not pen.valid?
    assert_includes pen.errors[:price], "can't be blank"
  end

  test "invalid with non-numeric price" do
    pen = Pen.new(title: "Test Pen", price: "not a number")
    assert_not pen.valid?
    assert_includes pen.errors[:price], "is not a number"
  end

  test "invalid with zero price" do
    pen = Pen.new(title: "Test Pen", price: 0)
    assert_not pen.valid?
    assert_includes pen.errors[:price], "must be greater than 0"
  end

  test "invalid with negative price" do
    pen = Pen.new(title: "Test Pen", price: -5)
    assert_not pen.valid?
    assert_includes pen.errors[:price], "must be greater than 0"
  end

  test "valid without description" do
    pen = Pen.new(title: "Test Pen", price: 19.99)
    assert pen.valid?
  end

  test "search scope finds pens by title" do
    pens = Pen.search("Pilot")
    assert_includes pens, pens(:one)
    assert_not_includes pens, pens(:two)
  end

  test "search scope finds pens by description" do
    pens = Pen.search("German")
    assert_includes pens, pens(:two)
    assert_not_includes pens, pens(:one)
  end

  test "search scope returns all pens when query is blank" do
    assert_equal Pen.all.count, Pen.search("").count
    assert_equal Pen.all.count, Pen.search(nil).count
  end

  test "recent scope orders by newest first" do
    pens = Pen.recent
    assert_equal pens.first.created_at >= pens.last.created_at, true
  end
end
