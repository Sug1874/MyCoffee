require "test_helper"

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:one)
    @item = @user.items.build(name: "Item", 
                bitterness: 1, acidity: 1, body: 1, 
                roast: "Light",
                variety: "Typica",
                process: "Natural",
                farm: "abcfarm",
                shop_url: "example.com/items/1",
                description: "")
  end

  test "should be valid" do
    assert @item.valid?
  end

  test "user id should be presence" do
    @item.user_id = nil
    assert_not @item.valid?
  end

  test "name should be present" do
    @item.name = "  "
    assert_not @item.valid?
  end

  test "name should not be too long" do
    @item.name = "a"*51
    assert_not @item.valid?
  end

  test "bitterness should be more than 0" do
    @item.bitterness = 0
    assert_not @item.valid?
    @item.bitterness = 1
    assert @item.valid?
  end

  test "bitterness should be equal to or less than 5" do
    @item.bitterness = 6
    assert_not @item.valid?
    @item.bitterness = 5
    assert @item.valid?
  end

  test "acidity should be more than 0" do
    @item.acidity = 0
    assert_not @item.valid?
    @item.acidity = 1
    assert @item.valid?
  end

  test "acidity should be equal to or less than 5" do
    @item.acidity = 6
    assert_not @item.valid?
    @item.acidity = 5
    assert @item.valid?
  end

  test "body should be more than 0" do
    @item.body = 0
    assert_not @item.valid?
    @item.body = 1
    assert @item.valid?
  end

  test "body should be equal to or less than 5" do
    @item.body = 6
    assert_not @item.valid?
    @item.body = 5
    assert @item.valid?
  end

  test "variety should not be too long" do
    @item.variety = "a"*51
    assert_not @item.valid?
  end

  test "process should not be too long" do
    @item.process = "a"*51
    assert_not @item.valid?
  end

  test "farm should not be too long" do
    @item.farm = "a"*51
    assert_not @item.valid?
  end

  test "order should be most recent first" do
    assert_equal items(:most_recent), Item.first
  end
end
