require "minitest/autorun"
require "../src/cabinet"

class CabinetTest < MiniTest::Unit::TestCase
  def test_available_boxes_should_return_available_box_number
    cabinet = Cabinet.new(1)
    assert_equal 1, cabinet.available_boxes
  end

  def test_should_tell_cabinet_can_store_bag
    cabinet = Cabinet.new(1)
    assert cabinet.storable?
  end

  def test_should_tell_cabinet_can_not_store_bag
    cabinet = Cabinet.new(0)
    assert !cabinet.storable?
  end
end