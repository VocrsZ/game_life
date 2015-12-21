require './controller/game_controller.rb'


test = GameController.new([5, 5])
test.make_steps(100)