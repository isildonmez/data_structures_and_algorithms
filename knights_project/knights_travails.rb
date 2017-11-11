require_relative 'knights_tree'

def knight_moves(starting_point, ending_point)
  path = [ending_point]
  last_node = Node.build_path(starting_point, ending_point)
  until last_node.coordinate == starting_point
    path = [last_node.coordinate] + path
    last_node = last_node.parent_node
  end
  path = [starting_point] + path
end

p knight_moves([3,3],[2,5])
p knight_moves([3,3], [3,7])