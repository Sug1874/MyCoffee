require "test_helper"

class TasteTest < ActiveSupport::TestCase
  def setup
    @item = items(:one)
    @taste = @item.tastes.new(taste: "Sweet")
  end

  test "should be valid" do
    assert @taste.valid?
  end

  test "item id should be presence" do
    @taste.item_id = nil
    assert_not @taste.valid?
  end

  test "taste should be presence" do
    @taste.taste = " "
    assert_not @taste.valid?
  end

  test "taste should not be too long" do
    @taste.taste = "a"*51
    assert_not @taste.valid?
  end
end
