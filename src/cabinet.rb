require_relative "cabinet_exception"
require_relative "bag"
require_relative "ticket"

class Cabinet
  def initialize capacity
    @capacity = capacity
    @ticket_bag_map = Hash.new
  end

  def available_boxes
    @capacity
  end

  def storable?
    available_boxes > 0
  end

  def store bag
    raise CabinetException.new("failed to store, no empty box.") if !storable?
    ticket = Ticket.new
    @ticket_bag_map[ticket] = bag
    ticket
  end

  def pick ticket
    @ticket_bag_map[ticket]
  end
end