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
    head
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
    place_the_element(element, compared)
  end

  def self.breadth_first_search(target_value, head)
    return head if head.value == target_value
    queue = [head]

    until queue.empty?
      return queue[0] if queue[0] == target_value
      queue << queue[0].left unless queue[0].left.nil?
      queue << queue[0].right unless queue[0].right.nil?
      queue.shift
    end
    nil
  end

  def self.depth_first_search(target_value, head)
    stack = [head]
    until stack.empty?
      return stack[-1] if stack[-1] == target_value
      last = stack.pop
      stack << last.left unless last.left.nil?
      stack << last.right unless last.right.nil?
    end
    nil
  end

  def self.dfs_rec(target_value, head)
    return nil if head.nil?
    return head if target_value == head.value
    result = dfs_rec(target_value, head.left)
    return result unless result.nil?
    dfs_rec(target_value, head.right)
  end

  def self.quick_search(target_value, compared)
    return nil if compared == nil
    return compared if target_value == compared.value
    compared = compared.left if target_value < compared.value
    compared = compared.right if target_value >= compared.value

    quick_search(target_value, compared)
  end

  def self.breadth_first_search_alternative(target_value, head)
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
    nil
  end
end

p Node.build_tree([8,3,10,1,6,14,4,7,13])

binary_tree = Node.build_tree([8,3,10,1,6,14,4,7,13])

p Node.breadth_first_search_alternative(17, binary_tree)
p Node.breadth_first_search_alternative(14, binary_tree)

p Node.breadth_first_search(17, binary_tree)
p Node.breadth_first_search(14, binary_tree)

p Node.depth_first_search(17, binary_tree)
p Node.depth_first_search(14, binary_tree)

p Node.depth_first_search_alternative(17, binary_tree)
p Node.depth_first_search_alternative(14, binary_tree)

p Node.dfs_rec(17, binary_tree)
p Node.dfs_rec(14, binary_tree)

p Node.quick_search(17, binary_tree)
p Node.quick_search(14, binary_tree)
