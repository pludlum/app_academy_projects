require 'byebug'
class PolyTreeNode
  attr_reader :value
  attr_accessor :parent, :children

  def initialize(value, children = [], parent = nil)
    @value = value
    @children = children
    @parent = parent
  end

  def parent=(new_parent)
    return if new_parent == @parent
    @parent.children.delete(self) unless @parent.nil?
    @parent = new_parent
    new_parent.children << self unless @parent.nil?
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "error" unless @children.include?(child_node)
    child_node.parent = nil
  end

  def dfs(target_value)
    return self if self.value == target_value
    @children.each do |child|
      result = child.dfs(target_value)
      return result unless result.nil?
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      ele = queue.shift
      return ele if ele.value == target_value
      ele.children.each do |node|
        queue << node
      end
    end
  end

end
