/*

 Given a binary tree, return the preorder traversal of its nodes' values.
 
 # Example:
 
 Input: [1,null,2,3]
    1
     \
      2
     /
    3
 
 Output: [1,2,3]
 
 Follow up: Recursive solution is trivial, could you do it iteratively?
 
 (94. Binary Tree Inorder Traversal)
 
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
    // 8 ms, faster than 60.44%
    // 20.8 MB, less than 16.67%
//    func preorderTraversal(_ root: TreeNode?) -> [Int] {
//        // Stack
//        guard let root = root else { return [] }
//        var result: [Int] = []
//        var stack: [TreeNode] = []
//        var node: TreeNode? = root
//        while node != nil || !stack.isEmpty {
//            if let n = node {
//                stack.append(n) // push
//                result.append(n.val)
//                node = n.left
//            } else {
//                let n = stack.last // pop
//                stack.removeLast()
//                node = n?.right
//            }
//        }
//        return result
//    }
    
    // !!! LNR
    // 4 ms, faster than 96.34%
    // 20.8 MB, less than 16.67%
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        // Stack
        guard let root = root else { return [] }
        var result: [Int] = []
        var stack: [TreeNode] = [root]
        while !stack.isEmpty {
            let temp = stack.popLast()!
            result.append(temp.val)
            if let right = temp.right {
                stack.append(right)
            }
            if let left = temp.left {
                stack.append(left)
            }
        }
        return result
    }
}

var node = TreeNode(1)
node.right = TreeNode(2)
node.right?.left = TreeNode(3)
Solution().preorderTraversal(node) // [1,2,3]

node = TreeNode(1)
node.left = TreeNode(2)
node.left?.left = TreeNode(4)
node.left?.right = TreeNode(5)
node.right = TreeNode(3)
node.right?.left = TreeNode(6)
node.right?.right = TreeNode(7)
Solution().preorderTraversal(node) // [1,2,4,5,3,6,7]

node = TreeNode(3)
node.left = TreeNode(9)
node.left?.left = TreeNode(11)
node.left?.left?.left = TreeNode(13)
node.left?.left?.right = TreeNode(14)
node.left?.right = TreeNode(12)
node.left?.right?.left = TreeNode(15)
node.left?.right?.right = TreeNode(16)
node.right = TreeNode(20)
Solution().preorderTraversal(node) // [3,9,11,13,14,12,15,16,20]

/*
 
             3
           /   \
          9     20
       /     \
      11     12
     /  \   /  \
    13  14 15  16
 
 
 */

