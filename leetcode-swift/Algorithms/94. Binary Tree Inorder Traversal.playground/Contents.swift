/*
 
 Given a binary tree, return the inorder traversal of its nodes' values.
 
 # Example:
 
 Input: [1,null,2,3]
    1
     \
      2
     /
    3
 
 Output: [1,3,2]
 
 Follow up: Recursive solution is trivial, could you do it iteratively?
 
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
    // !!! LNR recursive
    // 0 ms, faster than 100.00%
    // 21.2 MB, less than 12.50%
//    func inorderTraversal(_ root: TreeNode?) -> [Int] {
//        guard let root = root else { return [] }
//        return recursive(root)
//    }
//
//    private func recursive(_ root: TreeNode?) -> [Int] {
//        guard let root = root else { return [] }
//        return recursive(root.left) + [root.val] + recursive(root.right)
//    }
    
    // !!! LNR iterative
    // 0 ms, faster than 100.00%
    // 20.9 MB, less than 12.50%
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        // Stack
        guard let root = root else { return [] }
        var result: [Int] = []
        var stack: [TreeNode] = []
        var node: TreeNode? = root // from root or node.right
        while node != nil || !stack.isEmpty {
            while node != nil {
                /*
                 將 node 視為新 root (node = node!.right)，並把它左側的節點都先 push 到 stack
                 如果前一次取的 node!.right 為 null (也不會進入這個 while loop)
                 就不會有新節點被 push 到 stack，而下面 pop 的節點就會是前一個 node!.right 的 node
                 */
                stack.append(node!) // push a TreeNode to stack
                node = node!.left
            }
            
            node = stack.last // pop a TreeNode from stack
            stack.removeLast()
            
            result.append(node!.val)
            node = node!.right
        }
        return result
    }
}

var node = TreeNode(1)
node.right = TreeNode(2)
node.right?.left = TreeNode(3)
Solution().inorderTraversal(node) // [1,3,2]

node = TreeNode(1)
node.left = TreeNode(2)
node.left?.left = TreeNode(4)
node.left?.right = TreeNode(5)
node.right = TreeNode(3)
node.right?.left = TreeNode(6)
node.right?.right = TreeNode(7)
Solution().inorderTraversal(node) // [4,2,5,1,6,3,7]

node = TreeNode(3)
node.left = TreeNode(9)
node.left?.left = TreeNode(11)
node.left?.left?.left = TreeNode(13)
node.left?.left?.right = TreeNode(14)
node.left?.right = TreeNode(12)
node.left?.right?.left = TreeNode(15)
node.left?.right?.right = TreeNode(16)
node.right = TreeNode(20)
Solution().inorderTraversal(node) // [13,11,14,9,15,12,16,3,20]

/*
 
          3
        /   \
       9     20
    /     \
   11     12
  /  \   /  \
 13  14 15  16
 
 
 */
