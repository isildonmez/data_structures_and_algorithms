class Node
  attr_accessor :coordinate, :parent_node, :coordinate_options

  def initialize(coordinate, parent_node = nil, coordinate_options = [])
    @coordinate = coordinate
    @parent_node = parent_node
    @coordinate_options = coordinate_options
  end

  def self.build_path(starting_point, ending_point)
    head = Node.new(starting_point)
    queue = []
    queue << head
    to_add = [ [-1, -2], [1, -2], [1, 2], [-1, 2],
              [2, -1], [2, 1], [-2, 1], [-2, -1] ]

    until queue.empty?
      current_node = queue.shift

      current_node.coordinate_options = to_add.map do |coord|
        new_coord = current_node.coordinate.zip(coord).map{ |arr| arr[0] + arr[1] }
        new_coord = nil unless new_coord.any? {|num| num.between?(0,7)}
        new_coord
      end.compact

      current_node.coordinate_options.each do |coord|
        queue << Node.new(coord, current_node)
      end
      return current_node if current_node.coordinate_options.include? ending_point
    end
  end

end

# p Node.build_path([3,3], [2,5])
# p Node.build_path([3,3], [3,7])

