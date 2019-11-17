/*
 
 Given a binary search tree, write a function kthSmallest to find the kth smallest element in it.
 
 Note:
 You may assume k is always valid, 1 ≤ k ≤ BST's total elements.
 
 # Example 1:
 
 Input: root = [3,1,4,null,2], k = 1
     3
    / \
   1   4
    \
     2
 
 Output: 1
 
 # Example 2:
 
 Input: root = [5,3,6,2,4,null,null,1], k = 3
          5
         / \
        3   6
       / \
      2   4
     /
    1
 
 Output: 3
 
 Follow up:
 
 What if the BST is modified (insert/delete operations) often and you need to find the kth smallest frequently? How would you optimize the kthSmallest routine?
 
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
    // 76 ms, faster than 24.19%
    // 22.1 MB, less than 25.00%
//    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
//        guard let root = root else { return 0 }
//        var array: [Int] = []
//        dfs(root, &array)
//        array = array.sorted(by: <)
//        return array[k - 1]
//    }
//
//    private func dfs(_ node: TreeNode?, _ array: inout [Int]) {
//        guard let node = node else { return }
//        dfs(node.left, &array)
//        dfs(node.right, &array)
//        array.append(node.val)
//    }
    
    // !!!
    // 68 ms, faster than 84.41%
    // 21.7 MB, less than 25.00%
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        guard let root = root else { return 0 }
        let leftSize = treeSize(root.left)
        if leftSize + 1 == k {
            return root.val
        } else if leftSize >= k {
            return kthSmallest(root.left, k)
        } else if leftSize < k {
            return kthSmallest(root.right, k - leftSize - 1) // k - leftSize - root_node
        }
        return 0
    }
    
    func treeSize(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        return 1 + treeSize(node.left) + treeSize(node.right)
    }
}

var node = TreeNode(3)
node.left = TreeNode(1)
node.left?.right = TreeNode(2)
node.right = TreeNode(4)
Solution().kthSmallest(node, 1) // 1

node = TreeNode(5)
node.left = TreeNode(3)
node.left?.left = TreeNode(2)
node.left?.left?.left = TreeNode(1)
node.left?.right = TreeNode(4)
node.right = TreeNode(6)
Solution().kthSmallest(node, 3) // 3
