/*
 
 Given a binary tree, find its maximum depth.
 
 The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
 
 Note: A leaf is a node with no children.
 
 # Example:
 
 Given binary tree [3,9,20,null,null,15,7],
 
     3
    / \
   9  20
     /  \
    15   7
 return its depth = 3.
 
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
    // *** 32 ms / 21.6 MB ***
//    private func findDepth(_ root: TreeNode, depth: Int) -> Int {
//        guard root.left != nil || root.right != nil else {
//            return depth
//        }
//        var maxValue = depth
//        if let left = root.left {
////            let depth = findDepth(left, depth: depth + 1)
////            if depth > maxValue {
////                maxValue = depth
////            }
//            maxValue = max(maxValue, findDepth(left, depth: depth + 1))
//        }
//        if let right = root.right {
////            let depth = findDepth(right, depth: depth + 1)
////            if depth > maxValue {
////                maxValue = depth
////            }
//            maxValue = max(maxValue, findDepth(right, depth: depth + 1))
//        }
//        return maxValue
//    }
//
//    func maxDepth(_ root: TreeNode?) -> Int {
//        guard let node = root else {
//            return 0
//        }
//        return findDepth(node, depth: 1)
//    }
    
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let node = root else {
            return 0
        }
        return max(maxDepth(node.left), maxDepth(node.right)) + 1
    }
}
var node = TreeNode(3)
node.left = TreeNode(9)
node.right = TreeNode(20)
node.right?.left = TreeNode(15)
node.right?.right = TreeNode(7)
Solution().maxDepth(node)

node = TreeNode(4)
node.left = TreeNode(1)
node.left?.left = TreeNode(0)
node.left?.right = TreeNode(2)
node.left?.right?.right = TreeNode(3)
node.right = TreeNode(6)
node.right?.left = TreeNode(5)
node.right?.right = TreeNode(7)
node.right?.right?.right = TreeNode(8)
Solution().maxDepth(node)
