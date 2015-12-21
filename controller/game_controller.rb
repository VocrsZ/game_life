require_relative '../model/game.rb'

class GameController

  attr_reader :process

	def initialize
		@life = Game.new
    @process = false
	end

  def make_steps(count = 1, delay = 1)
    @process = true
    count.times do |t|
      return unless @process
      return t if @life.stop_game?
      @life.iterate!
      sleep delay
    end
    @process = false
  end

  def stop
    @process = false
  end

end