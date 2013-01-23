require_relative "cabinet_exception"
require_relative "bag"
require_relative "ticket"

class Robot
  def initialize *cabinets
    @cabinets = cabinets
  end

  def storable?
    @cabinets.find {|c| c.storable?} != nil
  end
end