class Cabinet
  def initialize capacity
    @capacity = capacity
  end

  def available_boxes
    @capacity
  end

  def can_store?
    available_boxes > 0
  end
end