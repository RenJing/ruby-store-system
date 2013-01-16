require_relative "cabinet_exception"
require_relative "bag"
require_relative "ticket"

class Cabinet
  def initialize capacity
    @capacity = capacity
  end

  def available_boxes
    @capacity
  end

  def storable?
    available_boxes > 0
  end

  def store bag
    raise CabinetException.new("failed to store, no empty box.") if !storable?
    return Ticket.new
  end
end