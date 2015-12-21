require 'spec_helper'
require_relative '../model/game.rb'

describe Game do
	
  describe "should create game" do

    subject(:life) { Game.new([2, 2]) }

    it { should respond_to :get_screen }

    it "3x3 size at least" do
      expect(life.width).to be >=3
      expect(life.height).to be >=3
    end
  end

  describe "population" do

    context "by default" do

      let(:life) { Game.new([3, 3], :population => :default) }
      let(:new_life) { Game.new([3, 3], :population => :default) }

      it "should repeat" do
        expect(life.get_screen).to eq(new_life.get_screen)
      end
    end

    context "by random" do

      let(:life) { Game.new([3, 3], :population => :random) }
      let(:new_life) { Game.new([3, 3], :population => :random) }

      it "should be an Array" do
        expect(life.get_screen).to be_instance_of Array
      end

      it "should not repeat" do
        expect(life.get_screen).to_not eq(new_life.get_screen)
      end
    end
  end

  describe "iterate method" do

    let(:life) { Game.new([3, 3], population => :default) }
    let(:next_step) { [[false, true, false], [false, true, false], [false, true, false]] }

    before do
      life.iterate!
    end

    it "should eq to the next step generation" do
      expect(life.get_screen).to eq(next_step)
    end
  end
end