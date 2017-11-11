class Node
  attr_accessor :coordinate, :parent_node, :coordinate_options

    def initialize(coordinate, parent_node = nil, coordinate_options = [])
      @coordinate = coordinate
      @parent_node = parent_node
      @coordinate_options = coordinate_options
    end

    # TODO
    def self.build_tree(starting_point, ending point)
      head = Node.new(starting_point)
      current_node = head

      to_add = [ [-1, -2], [1, -2], [1, 2], [-1, 2]
                [2, -1], [2, 1], [-2, 1], [-2, -1] ]

      current_node.coordinate_options = to_add.map do |coord|
        coord[0] = starting_point[0] + coord[0]
        coord[1] = starting_point[1] + coord[1]
      end.compact

      return head if current_node.coordinate_options.include? ending_point

      current_node.coordinate_options.each do |coord|
        Node.new(coord, current_node)
      end



    end

