class Node
  attr_accessor :coordinate, :parent_node, :left_down_1, :left_down_2, :right_down_1,
                :right_down_2, :left_up_1, :left_up_2, :right_up_1, :right_up_2

    def initialize(coordinate, parent_node = nil, left_down_1 = nil, left_down_2 = nil, left_up_1 = nil, left_up_2 = nil,
                   right_up_1 = nil, right_up_2 = nil, right_down_1 = nil, right_down_2 = nil)
      @coordinate = coordinate
      @parent_node = parent_node
      @left_down_1 = left_down_1
      @left_down_2 = left_down_2
      @left_up_1 = left_up_1
      @left_up_2 = left_up_2
      @right_down_1 = right_down_1
      @right_down_2 = @right_down_2
      @right_up_1 = @right_up_1
      @right_up_2 = right_up_2
    end

    def self.build_tree(starting_point)
      head = Node.new(starting_point)
      
    end

