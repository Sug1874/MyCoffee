require "test_helper"

class RoastTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @roast = Roast.new(roast_level: "Light")
  end

  test "should be valid" do
    assert @roast.valid?
  end

  test "roast should be present" do
    @roast.roast_level = nil
    assert_not @roast.valid?
  end

  test "roast should not be too long" do
    @roast.roast_level = "a"*51
    assert_not @roast.valid?
  end
end
