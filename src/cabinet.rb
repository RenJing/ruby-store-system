require_relative "cabinet_exception"
require_relative "bag"
require_relative "ticket"

class Cabinet
  def initialize capacity
    @capacity = capacity
    @ticket_bag_map = Hash.new
    @available_box_count = capacity
  end

  def available_boxes
    @available_box_count
  end

  def storable?
    available_boxes > 0
  end

  def store bag
    raise CabinetException.new("failed to store, no empty box.") if !storable?
    ticket = Ticket.new
    @ticket_bag_map[ticket] = bag
    @available_box_count -= 1
    ticket
  end

  def pick ticket
    bag = @ticket_bag_map[ticket]
    @ticket_bag_map[ticket] = nil unless bag.nil?
    bag
  end
end