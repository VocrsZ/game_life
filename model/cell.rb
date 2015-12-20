class Cell

  attr_writer :neighbors

  def initialize(chance = 0.1)
    @alive = rand > 0.1 ? false : true
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