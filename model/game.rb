require_relative 'cell.rb'

class Game

  attr_reader :width, :height

  DEFAULT_POPULATION = [[false, false, false], [true, true, true], [false, false, false]]

  def initialize(size = [3, 3], options = {:population => :random})

    @width = size[0] < 3 ? 3 : size[0]
    @height = size[1] < 3 ? 3 : size[1]
    @screen = Array.new

    if options[:population] == :default
      populate_by_default
    else
      populate_by_random
    end
  end

  def get_screen
    @screen.each_with_index.map do |row, y|
      row.each_with_index.map do |cell, x|
        cell.alive?
      end
    end
  end

  def iterate!
    @screen.each_with_index.map do |row, y|
      row.each_with_index.map do |cell, x|
        set_alive_neighbor_count(x, y)
      end
    end

    @screen.each_with_index.map do |row, y|
      row.each_with_index.map do |cell, x|
        @screen[y][x].iterate!
      end
    end
  end

  def stop_game?
    (get_alive_count == @width * @height) or (get_alive_count == 0)
  end

  private

    def populate_by_default
      @height.times do |h|
        @screen[h] = Array.new
        @width.times do |w|
          @screen[h][w] = DEFAULT_POPULATION[h].nil? ? Cell.new(false) : Cell.new(DEFAULT_POPULATION[h][w])
        end
      end
    end

    def populate_by_random
      @height.times do |h|
        @screen[h] = Array.new
        @width.times do |w|
          @screen[h][w] = rand < 0.3 ? Cell.new(true) : Cell.new(false)
        end
      end
    end

    def set_alive_neighbor_count(x, y)
      circle = [-1, 0, 1]
      count = 0
      (circle.product(circle) - [[0, 0]]).each do |offset|
        next if offset[1] + y < 0 || offset[0] + x < 0 || offset[0] + x >= @width || offset[1] + y >= @height
        if @screen[offset[1] + y][offset[0] + x].alive?
          count += 1 
        end
      end
      @screen[y][x].neighbors = count
    end

    def get_alive_count
      @screen.flatten.count { |cell| cell.alive? }
    end

end
