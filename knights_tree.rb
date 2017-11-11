class Node
  attr_accessor :array, :parent_node, :coordinate_options

    def initialize(array, parent_node = nil, coordinate_options = [])
      @array = array
      @parent_node = parent_node
      @coordinate_options = coordinate_options
    end

    def self.build_tree(starting_point)
      head = Node.new(starting_point)


      to_add = [ [-1, -2], [1, -2], [1, 2], [-1, 2]
                [2, -1], [2, 1], [-2, 1], [-2, -1] ]
      head.
    end

