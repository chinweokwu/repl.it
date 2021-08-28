# nodes in the tree
class Node
    attr_accessor :value, :left, :right
    def initialize(value, left = nil, right = nil)
        @value = value
    end
end

class BinarySearchTree
    attr_accessor :root, :size
    def initialize
        @root = nil
        @size = 0;
    end

def insert(value)
    if @root == nil
        @root = Node.new(value)
    else
        curr_node = @root
        previous_node = @root
        #while loop helps finding the position of insertion
        while curr_node != nil
            previous_node = curr_node
            if value < curr_node.value
                curr_node = curr_node.left
            else
                curr_node = curr_node.right
            end
        end
        if value < previous_node.value
            previous_node.left = Node.new(value)
        else
            previous_node.right = Node.new(value)
        end
    end
    @size += 1
end

    def pre_order
        @result = []
        def traverse(node)
            @result.push(node.value)
            traverse(node.left) if node.left
            traverse(node.right) if node.right
        end
        traverse(@root)
        return @result.join(' ')
    end
    def post_order
        @result = []
          def traverse(node)
              traverse(node.left) if node.left
              traverse(node.right) if node.right
              @result.push(node.value)
          end
          traverse(@root)
          return @result.join(' ')
      end
    
      def in_order
        @result = []
        def traverse(node)
            traverse(node.left) if node.left
            @result.push(node.value)
            traverse(node.right) if node.right
           
        end
        traverse(@root)
        return @result.join(' ')
      end
    
end


tree = BinarySearchTree.new
tree.insert(5)
tree.insert(3)
tree.insert(7)
tree.insert(1)
tree.insert(2)
tree.insert(6)
tree.insert(8)
# tree.insert(4)
# tree.insert(7)
# tree.insert(13)

print tree.pre_order
# puts tree.pre_order(tree)
# # => "8 3 1 6 4 7 10 14 13"

#[5, 3, 7, 1, 2, 6, 8]
#=>"5 3 1 2 7 6 8"

#[50, 25, 75, 15, 21, 62, 91]
#=>"50 25 15 21 75 62 91"
