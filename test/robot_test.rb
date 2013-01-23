require "minitest/autorun"
require "../src/cabinet"
require "../src/cabinet_exception"
require "../src/bag"
require "../src/ticket"
require "../src/robot"

class RobotTest < MiniTest::Unit::TestCase
  def test_should_not_be_storable_if_all_cabinet_are_not_storable
    cabinet = Cabinet.new(0)
    robot = Robot.new(cabinet)
    assert !robot.storable?
  end

  def test_should_be_storable_if_any_of_cabinet_is_storable
    cabinet1 = Cabinet.new(0)
    cabinet2 = Cabinet.new(1)
    robot = Robot.new(cabinet1, cabinet2)
    assert robot.storable?
  end

  def test_should_store_bag_successfully_in_first_cabinet_with_empty_box
    cabinet1 = Cabinet.new(1)
    cabinet2 = Cabinet.new(2)
    robot = Robot.new(cabinet1, cabinet2)
    ticket = robot.store Bag.new
    assert_instance_of Ticket, ticket
    assert !cabinet1.storable?
  end
end