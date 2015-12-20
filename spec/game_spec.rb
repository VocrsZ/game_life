require 'spec_helper'
require_relative '../model/game.rb'

describe Game do
	
  describe "should create game" do

    subject(:life) { Game.new([2, 2]) }

    it { should respond_to :screen }

    it "3x3 size at least" do
      expect(life.width).to be >=3
      expect(life.height).to be >=3
    end
  end

  describe "population" do

    context "by default" do

      let(:life) { Game.new([3, 3], :population => :default) }

      it "should be eq to Game's default population" do
        expect(life.screen).to eq(Game::DEFAULT_POPULATION)
      end
    end

    context "by random" do

      let(:life) { Game.new([3, 3], :population => :random) }
      let(:new_life) { Game.new([3, 3], :population => :random) }

      it "should be an Array" do
        expect(life.screen).to be_instance_of Array
      end

      it "should not repeat" do
        expect(life.screen).to_not eq(new_life.screen)
      end
    end
  end
end