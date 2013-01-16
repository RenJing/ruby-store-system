require "minitest/autorun"
require "../src/cabinet"

class CabinetTest < MiniTest::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_should_return_available_box_number
    cabinet = Cabinet.new(1)
    assert_equal 1, cabinet.available_boxes
  end
end