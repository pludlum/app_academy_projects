require_relative '../poly_tree_node/lib/00_tree_node.rb'

class KnightPathFinder

  attr_accessor :visited_positions, :move_tree, :trace

  def initialize(pos = [0,0])
    @pos = pos
    @visited_positions = [pos]
    @move_tree = build_move_tree(pos)
    @trace = []
  end

  def build_move_tree(start_pos)
    root = PolyTreeNode.new(start_pos)
    queue = [root]
    until queue.empty?
      node = queue.shift
      # @move_tree << node
      new_move_positions(node.value).each do |el|
        new_node = PolyTreeNode.new(el)
        new_node.parent = node
        queue += [new_node]
      end
    end
    root
  end

  def self.valid_moves(pos)
    moves = [1,2,-1,-2]
            .permutation(2)
            .to_a
            .reject {|el| el.reduce(:+) == 0}

    moved = []

    moves.each do |el|
      moved << [pos[0] + el[0], pos[1] + el[1]]
    end

    moved.reject {|el| !el[0].between?(0,7) || !el[1].between?(0,7)}

  end

  def new_move_positions(pos)
    valid_moves = KnightPathFinder.valid_moves(pos)
    non_repeated_moves = valid_moves.reject {|el| @visited_positions.include?(el)}
    @visited_positions += non_repeated_moves
    non_repeated_moves
  end

  def find_path(end_pos)
    return self if self.value == end_pos
    self.children.each do |child|
      result = child.find_path(end_pos)
      return result unless result.nil?
    end
    nil
  end


end

knight = KnightPathFinder.new([0,0])
knight.build_move_tree([0,0])
object = knight.move_tree
p object.dfs([0,0]).children.map(&:value)
