/*
 
 Given two binary trees and imagine that when you put one of them to cover the other, some nodes of the two trees are overlapped while the others are not.
 
 You need to merge them into a new binary tree. The merge rule is that if two nodes overlap, then sum node values up as the new value of the merged node. Otherwise, the NOT null node will be used as the node of new tree.
 
 # Example 1:
 
 Input:
 
 Tree 1                     Tree 2
     1                         2
    / \                       / \
   3   2                     1   3
  /                           \   \
 5                             4   7
 
 Output:
 
 Merged tree:
     3
    / \
   4   5
  / \   \
 5   4   7

 
 Note: The merging process must start from the root nodes of both trees.
 
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
    // 100 ms, faster than 95.04%
    // 21.6 MB, less than 100.00%
    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        var node: TreeNode?
        if let t1 = t1, let t2 = t2 {
            node = TreeNode(t1.val + t2.val)
            node!.left = mergeTrees(t1.left, t2.left)
            node!.right = mergeTrees(t1.right, t2.right)
        } else if let t1 = t1 {
            node = t1
        } else if let t2 = t2 {
            node = t2
        }
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

var node1 = TreeNode(1)
node1.left = TreeNode(3)
node1.left?.left = TreeNode(5)
node1.right = TreeNode(2)
var node2 = TreeNode(2)
node2.left = TreeNode(1)
node2.left?.right = TreeNode(4)
node2.right = TreeNode(3)
node2.right?.right = TreeNode(7)
var node = Solution().mergeTrees(node1, node2)
//printNode(node)


node1 = TreeNode(1)
node1.left = TreeNode(2)
node1.left?.left = TreeNode(3)
node2 = TreeNode(1)
node2.right = TreeNode(2)
node2.right?.right = TreeNode(3)
node = Solution().mergeTrees(node1, node2)
printNode(node)
