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

    place_the_element(element, compared)
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
    return nil
  end

  def self.breadth_first_search(target_value, head)
    return head if head.value == target_value
    queue = [head]

    until queue.empty?
      unless queue[0].left.nil?
        return queue[0].left if queue[0].left.value == target_value
        queue << queue[0].left
      end
      unless queue[0].right.nil?
        return queue[0].right if queue[0].right.value == target_value
        queue << queue[0].right
      end
      queue.shift
    end
    return nil
  end

  # Pre-order: <root><left><right>
  def self.depth_first_search(target_value, head)
    return head if head.value == target_value
    stack = [head]

    until stack.empty?
      stack = scan_the_branch(target_value, stack)
      return stack unless stack.is_a? Array
    end
    nil
  end

  def self.scan_the_branch(target_value, stack)
    until stack[-1].left.nil?
      return stack[-1].left if stack[-1].left.value == target_value
      stack << stack[-1].left
    end
    until stack[-1].right
      stack.pop
      return [] if stack.empty?
    end
    return stack[-1].right if stack[-1].right.value == target_value
    stack[-1] = stack[-1].right
    return stack
  end

  # Pre-order: <root><left><right>
  def self.dfs_rec(target_value, head)
    return head if head.value == target_value
    stack = [head]

    scan_rec(target_value, stack)
  end

  def self.scan_rec(target_value, stack)
    until stack[-1].left.nil?
      return stack[-1].left if stack[-1].left.value == target_value
      stack << stack[-1].left
    end
    until stack[-1].right
      stack.pop
      return nil if stack.empty?
    end
    return stack[-1].right if stack[-1].right.value == target_value
    stack[-1] = stack[-1].right

    scan_rec(target_value, stack)
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

p Node.dfs_rec(17, binary_tree)
p Node.dfs_rec(14, binary_tree)

