require "test_helper"

class AreaTest < ActiveSupport::TestCase
  def setup
    @item = items(:one)
    @area = @item.areas.build(area: "Brazil")
  end

  test "should be valid" do
    assert @area.valid?
  end

  test "item id should be presence" do
    @area.item_id = nil
    assert_not @area.valid?
  end

  test "area should be presence" do
    @area.area = " "
    assert_not @area.valid?
  end

  test "area should not be too long" do
    @area.area = "a"*51
    assert_not @area.valid?
  end
end
