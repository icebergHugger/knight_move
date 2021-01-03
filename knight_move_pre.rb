class Node
  attr_accessor :value, :adjacent

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

class Graph
    attr_accessor :verts, :knight

    def initialize
      @verts = []
      @knight = Knight.new
      pop_verts
      pop_set
    end

    def mk_vert(value)
      verts.push(Node.new(value))
    end

    def mk_edge(st_node, fn_node)
      st_node.adjacent.push(fn_node)
    end

    def pop_verts
      cb = Board.new(8)
      cb.board.each { |spot| mk_vert(spot) }
    end

    def pop_set
      @verts.each do |vert_a|
        @verts.each do |vert_b|
          mk_edge(vert_a, vert_b) if @knight.legal_move?(vert_a.value, vert_b.value)
        end
      end
    end

    def pretty_print
      @verts.each do |vert|
        print vert.value
        print "Adjacent: "
        vert.adjacent.each { |adj| print adj.value }
        puts ""
      end
    end

    def find(value)
      verts.each { |current_node| return current_node if current_node.value == value}
    end

    def short_path(st_node, fn_node)
      queue = [st_node]
      pred = {}
      path = []

      @verts.each do |vert|
        pred[vert] = nil
      end

      until queue.empty?
        current = queue.shift
        break if current == fn_node

        current.adjacent.each do |adj|
          next if pred.values.include?(adj)
          queue.push(adj)
          pred[adj] = current
        end
      end

      until current == st_node
        path.unshift(current.value)
        current = pred[current]
      end

      path.unshift(st_node.value)

      path
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

def knight_move(start, finish)
  k = Graph.new
  k_moves = k.short_path(k.find(start), k.find(finish))
  puts "Success in : #{k_moves.length - 1} moves. Path ----->"
  k_moves.each do |move|
    if move != k_moves[-1]
      print "#{move}\n|\nV\n"
    else
      print "#{move}\n"
    end
  end
end

def input
  print "Enter start location: "
  start = gets.chomp.to_i
  st_array = start.to_s.split('').map(&:to_i)
  print "Enter final location: "
  final = gets.chomp.to_i
  fn_array = final.to_s.split('').map(&:to_i)

  if valid_input?(st_array) && valid_input?(fn_array)
    knight_move(st_array, fn_array)
  else
    puts "Invalid input try again."
    input
  end

end

def valid_input?(value)
  if (1..8).include?(value[0]) && (1..8).include?(value[1]) && value.length == 2  
    return true
  else
    return false
  end

end

input
