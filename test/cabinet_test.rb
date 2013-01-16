require "minitest/autorun"
require "../src/cabinet"
require "../src/cabinet_exception"
require "../src/bag"
require "../src/ticket"

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

  def test_should_failed_to_store_bag_if_no_empty_box
    cabinet = Cabinet.new(0)
    assert_raises(CabinetException){
      cabinet.store(Bag.new)
    }
  end

  def test_should_store_bag_successfully
    cabinet = Cabinet.new(1)
    ticket = cabinet.store(Bag.new)
    assert_instance_of(Ticket, ticket)
  end
end