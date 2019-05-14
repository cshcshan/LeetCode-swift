/*
 
 Given the root node of a binary search tree (BST) and a value to be inserted into the tree, insert the value into the BST. Return the root node of the BST after the insertion. It is guaranteed that the new value does not exist in the original BST.
 
 Note that there may exist multiple valid ways for the insertion, as long as the tree remains a BST after insertion. You can return any of them.
 
 # For example,
 
 Given the tree:
 
     4
    / \
   2   7
  / \
 1   3
 
 And the value to insert: 5
 
 You can return this binary search tree:
 
      4
     / \
    /   \
   2     7
  / \   /
 1   3 5
 
 This tree is also valid:
 
      5
     / \
    /   \
   2     7
  / \
 1   3
      \
       4
 
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
    // *** 200 ms / 22.1 MB ***
//    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
//        guard let node = root else { return TreeNode(val) }
//        if val > node.val {
//            if let right = node.right {
//                insertIntoBST(right, val)
//            } else {
//                node.right = TreeNode(val)
//            }
//        } else {
//            if let left = node.left {
//                insertIntoBST(left, val)
//            } else {
//                node.left = TreeNode(val)
//            }
//        }
//        return node
//    }
    
    // *** 192 ms / 21.8 MB ***
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let node = root else { return TreeNode(val) }
        if val > node.val {
            node.right = insertIntoBST(node.right, val)
        } else {
            node.left = insertIntoBST(node.left, val)
        }
        return node
    }
}

var node = TreeNode(4)
node.left = TreeNode(2)
node.left?.left = TreeNode(1)
node.left?.right = TreeNode(3)
node.right = TreeNode(7)
Solution().insertIntoBST(node, 5)

node = TreeNode(40)
node.left = TreeNode(20)
node.left?.left = TreeNode(10)
node.left?.right = TreeNode(30)
node.right = TreeNode(60)
node.right?.left = TreeNode(50)
node.right?.right = TreeNode(70)
Solution().insertIntoBST(node, 25)
