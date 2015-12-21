require 'spec_helper'
require_relative '../controller/game_controller.rb'

describe GameController do
	
	describe "should have process status" do

    subject(:play) { GameController.new }

    it { should respond_to :process }
    it "disable by default" do
      expect(play.process).to be_falsey
    end
  end
end