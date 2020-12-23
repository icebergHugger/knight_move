class Cell

  attr_reader :location, :visited

  attr_writer :children

  def initialize(location, visited=false)
    @location = location
    @visited = visited
    @children = [] #filled with 8 children
  end

end

def create_board
  8.times do |col|
    8.times do |row|
      cell = Cell.new([col + 1, row + 1])
    end
  end
end


create_board
