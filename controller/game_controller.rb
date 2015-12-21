require_relative '../model/game.rb'
require_relative '../view/game_view.rb'

class GameController

	def initialize(size = [3, 3], options = {:population => :random})
		@life = Game.new(size, options)
    @printer = GameView.new
    @process = false
	end

  def make_steps(count = 1, delay = 1)
    @process = true
    count.times do |t|
      return if !@process || @life.stop_game?
      @life.iterate!
      @printer.print(@life.get_screen)
      sleep delay
    end
    @process = false
  end

  def stop
    @process = false
  end

end
