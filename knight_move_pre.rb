class Node
  attr_accessor :value, :adjecent

  def initialize(value)
    @value = value
    @adjacent = []
  end

end

class Board
  attr_accessor :board

  def initialize(b)
    @board = chess_board(b)
  end

  def chess_board(b)
    arr = Array.new(b) { |index| index + 1}

    board = []
    arr.each do |i|
      arr.each do |j|
        board.push([i, j])
      end
    end
    board
  end

end
