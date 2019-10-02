/*
 
 Given the root of a binary search tree with distinct values, modify it so that every node has a new value equal to the sum of the values of the original tree that are greater than or equal to node.val.
 
 As a reminder, a binary search tree is a tree that satisfies these constraints:
 
 The left subtree of a node contains only nodes with keys less than the node's key.
 The right subtree of a node contains only nodes with keys greater than the node's key.
 Both the left and right subtrees must also be binary search trees.
 
 
 # Example 1:
 
       4
      / \
     /   \
    /     \
   1       6
  / \     / \
 0   2   5   7
      \       \
       3       8
 
           30
          /  \
         /    \
        /      \
       /        \
      /          \
    36            21
    / \          / \
  36   35      26   15
        \            \
        33            8
 
 
 
 Input: [4,1,6,0,2,5,7,null,null,null,3,null,null,null,8]
 Output: [30,36,21,36,35,26,15,null,null,null,33,null,null,null,8]
 
 
 Note:
 
 The number of nodes in the tree is between 1 and 100.
 Each node will have value between 0 and 100.
 The given tree is a binary search tree.
 
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
var node = TreeNode(4)
node.left = TreeNode(1)
node.left?.left = TreeNode(0)
node.left?.right = TreeNode(2)
node.left?.right?.right = TreeNode(3)
node.right = TreeNode(6)
node.right?.left = TreeNode(5)
node.right?.right = TreeNode(7)
node.right?.right?.right = TreeNode(8)

class Solution {
    // ### don't need to new TreeNode() ...  ###
//    func bstToGst(_ root: TreeNode?) -> TreeNode? {
//        print("root value: \(root?.val)")
//        guard let node = root else {
//            return root
//        }
//        let newNode = TreeNode(node.val)
//        let right = bstToGst(node.right)
//        print("root value: \(root?.val), right value: \(right?.val)")
//        if right != nil {
//            newNode.val += right!.val
//        }
//        let left = bstToGst(node.left)
//        if left != nil {
//            left!.val += newNode.val
//            newNode.left = left
//        }
//        print("root value: \(root?.val), left value: \(left?.val)")
//        return newNode
//    }
    
    // *** 12 ms / 21.1 MB ***
//    func bstToGst(_ root: TreeNode?) -> TreeNode? {
//        guard let node = root else {
//            return root
//        }
//        util(node: node, sum: 0)
//        return node
//    }
//
//    private func util(node: TreeNode, sum: Int) -> Int {
//        if let right = node.right {
//            node.val += util(node: right, sum: sum)
//        } else {
//            node.val += sum
//        }
//        if let left = node.left {
//            return util(node: left, sum: node.val)
//        } else {
//            return node.val
//        }
//    }
    
    // *** 8 ms / 20.7 MB ***
    var sum = 0
    func bstToGst(_ root: TreeNode?) -> TreeNode? {
        guard let node = root else { return root }
        bstToGst(node.right)
        node.val += sum
        sum = node.val
        bstToGst(node.left)
        return node
    }
    
    func printNode(_ node: TreeNode?) {
        guard let node = node else {
            return
        }
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
}

let newNode = Solution().bstToGst(node)
Solution().printNode(newNode)
