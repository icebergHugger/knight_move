count = 0
final_found = false

class Node

  attr_reader :location, :children
  attr_writer :children


  @@count = 0

  def initialize(location)
    @location = location
    @children = [] #filled with 8 children

    #@@count += 1
    #puts @@count
  end

end

def generate_tree(current, final)

  count = count + 1

  if count > 25
    count = 0
    return true
  end

  diff_loc = [-21,-19,-12,-8,8,12,19,21]

  if current.location == final.location
    puts "e"
    final_found = true
  end



  #loop current node location
  if !final_found && is_valid(current.location)
    diff_loc.each do |diff|
      new_node = Node.new(current.location + diff)
      if is_valid(new_node.location)
        current.children[diff_loc.index(diff)] = new_node
        #puts "new node #{new_node.location}"
      end
      generate_tree(new_node, final)
    end
  end

end

def is_valid(location)
  num = location.abs.digits
  if num.count == 2 && num[0].between?(1, 8) &&  num[1].between?(1, 8) && location > 0
    return true
  else
    return false
  end

end

def knight_move(start, final)
  start_node = Node.new(start)
  final_node = Node.new(final)
  generate_tree(start_node, final_node)
end


knight_move(44, 14)
