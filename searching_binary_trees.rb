class Node
  attr_accessor :value, :parent_node, :left, :right

  def initialize(value, parent_node = nil, left = nil, right = nil)
    @value = value
    @parent_node = parent_node
    @left = left
    @right = right
  end

  def self.build_sorted_tree(sorted_array)
    head = Node.new(sorted_array[0], nil, nil, nil)
    for i in 1...sorted_array.size
      current = Node.new(sorted_array[i], head, nil, nil)
      if current.value < head.value
        head.left = current
      else
        head.right = current
      end
      head = current
    end
    return head
  end

  def self.build_tree(array)
    head = Node.new(array[0], nil, nil, nil)
    for i in 1...array.size
      comparator = head
      place_the_element(array[i], comparator)
    end
    return head
  end

  def self.place_the_element(element, comparator)
    smaller = element < comparator.value ? true : false

    if smaller
      if comparator.left.nil?
        comparator.left = Node.new(element, comparator, nil, nil)
        return comparator
      end
      comparator = comparator.left
    else
      if comparator.right.nil?
        comparator.right = Node.new(element, comparator, nil, nil)
        return comparator
      end
      comparator = comparator.right
    end

    self.place_the_element(element, comparator)
  end


  def self.breadth_first_search(target_value)

  #returns node
  end

  def self.depth_first_search
  end

  def self.dfs_rec
  end

end

p Node.build_tree([8,3,10,1,6,14,4,7,13])