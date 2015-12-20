require 'spec_helper'
require_relative '../model/cell.rb'

describe Cell do
	
	subject(:cell) { Cell.new(0.1) }

	describe "create new cell" do

		it { should respond_to :neighbors= }
		it { should respond_to :alive? }
	end

	describe "iterate method" do
		context "with 1 neighbor" do
			before do
				cell.neighbors = 1
				cell.iterate!
			end

			it "should die" do
				expect(cell.alive?).to be_falsey
			end		
		end
		let(:status) { cell.alive? }
		context "width 2 neighbors" do
			before do
				cell.neighbors = 2
				cell.iterate!
			end

			it "should not change current status" do
				expect(cell.alive?).to eq(status)
			end
		end

		context "width 3 neighbors" do
			before do
				cell.neighbors = 3
				cell.iterate!
			end

			it "should rise from the ashes" do
				expect(cell.alive?).to be_truthy
			end
		end
	end
end