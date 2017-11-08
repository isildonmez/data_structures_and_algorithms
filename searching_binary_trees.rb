class Node
  attr_accessor :value, :parent_node, :left, :right

  def initialize(value, parent_node = nil, left = nil, right = nil)
    @value = value
    @parent_node = parent_node
    @left = left
    @right = right
  end

  def self.build_tree(array)
    head = Node.new(array[0], nil, nil, nil)
    for i in 1...array.size
      place_the_element(array[i], head)
    end
    return head
  end

  def self.place_the_element(element, compared)
    if element < compared.value
      if compared.left.nil?
        compared.left = Node.new(element, compared, nil, nil)
        return compared
      end
      compared = compared.left
    else
      if compared.right.nil?
        compared.right = Node.new(element, compared, nil, nil)
        return compared
      end
      compared = compared.right
    end

    self.place_the_element(element, compared)
  end


  # TODO: Consider how to write how deep you need to go.
  def self.breadth_first_search(target_value, array)
    head = self.build_tree(array)
    return head if head.value == target_value

    level_ordered_array = []
    control_array = [head]

    until control_array == level_ordered_array
      level_ordered_array = control_array
      control_array = level_ordered_array.map do |element|
        current_array = []
        unless element.left.nil?
          return element.left if element.left.value == target_value
          current_array << element.left
        end
        unless element.right.nil?
          return element.right if element.right.value == target_value
          current_array << element.right
        end
        current_array
      end.flatten
    end
    return nil
  end

  def self.depth_first_search
  end

  def self.dfs_rec
  end

end

# p Node.build_tree([8,3,10,1,6,14,4,7,13])
p Node.breadth_first_search(17, [8,3,10,1,6,14,4,7,13])