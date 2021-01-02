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

class Knight
  def initialize
  end

  def legal_move?(first, last)
    first_distance = first[0] - last[0]
    second_distance = first[1] - last[1]

    if first_distance.abs == 2 && second_distance.abs == 1 ||
    first_distance.abs == 1 && second_distance.abs == 2
      true
    else
      false
    end
  end
end
