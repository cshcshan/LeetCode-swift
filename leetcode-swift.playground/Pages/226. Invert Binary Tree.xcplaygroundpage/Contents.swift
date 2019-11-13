/*
 
 Invert a binary tree.
 
 # Example:
 
 Input:
 
      4
    /   \
   2     7
  / \   / \
 1   3 6   9
 
 Output:
 
      4
    /   \
   7     2
  / \   / \
 9   6 3   1
 
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
class Solution {
    // 4 ms, faster than 94.64%
    // 20.8 MB, less than 100.00%
//    func invertTree(_ root: TreeNode?) -> TreeNode? {
//        guard let root = root else { return nil }
//        let node = TreeNode(root.val)
//        let right = invertTree(root.left)
//        let left = invertTree(root.right)
//        node.left = left
//        node.right = right
//        return node
//    }
    
    // 4 ms, faster than 94.64%
    // 20.8 MB, less than 100.00%
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        let node = TreeNode(root.val)
        node.left = invertTree(root.right)
        node.right = invertTree(root.left)
        return node
    }
}

func printNode(_ node: TreeNode?) {
    guard let node = node else { return }
    print("value: \(node.val)")
    if let left = node.left {
        print("value left: \(left.val)")
    }
    if let right = node.right {
        print("value right: \(right.val)")
    }
    printNode(node.left)
    printNode(node.right)
}

var node = TreeNode(4)
node.left = TreeNode(2)
node.left?.left = TreeNode(1)
node.left?.right = TreeNode(3)
node.right = TreeNode(7)
node.right?.left = TreeNode(6)
node.right?.right = TreeNode(9)
var newNode = Solution().invertTree(node)
printNode(newNode)
