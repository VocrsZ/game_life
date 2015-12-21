class Cell

  attr_writer :neighbors

  def initialize(alive = false)
    @alive = alive
    @neighbors = 0
  end

  def iterate!
    case @neighbors
    when 2
      @alive
    when 3
      @alive = true
    else
      @alive = false
    end
  end

  def alive?
    @alive
  end
end