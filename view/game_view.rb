class GameView

  DEATH_CELL = "."
  ALIVE_CELL = "*"


  def initialize
  end

  def print(table)
    system('clear')
    @table = table
    puts self
  end

  def to_s
    @table.map { |row| row.map { |cell| cell ? ALIVE_CELL : DEATH_CELL }.join }.join("\n")
  end
end