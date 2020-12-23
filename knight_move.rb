
class Node

  attr_reader :location
  attr_writer :children

  def initialize(location)
    @location = location
    @children = [] #filled with 8 children
  end

end

def generate_tree(start, finsih)

  #loop current cell location

    #add each new cell to array

end

def knight_move(start, final)
  start_node = Node.new(start)
  final_node = Node.new(final)
  generate_tree(start_node, final_node)
end


knight_move([2,3],[1,4])
