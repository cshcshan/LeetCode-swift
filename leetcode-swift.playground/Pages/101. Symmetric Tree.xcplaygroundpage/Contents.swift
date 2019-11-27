/*
 
 Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).
 
 For example, this binary tree [1,2,2,3,4,4,3] is symmetric:
 
        1
       / \
      2   2
     / \ / \
    3  4 4  3
 
 
 But the following [1,2,2,null,3,null,3] is not:
 
        1
       / \
      2   2
       \   \
        3    3
 
 
 Note:
 Bonus points if you could solve it both recursively and iteratively.
 
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
    // 16 ms, faster than 76.49%
    // 20.3 MB, less than 100.00%
//    func isSymmetric(_ root: TreeNode?) -> Bool {
//        guard let root = root else { return true }
//        var result = true
//        recursively(root.left, root.right, &result)
//        return result
//    }
//
//    private func recursively(_ left: TreeNode?, _ right: TreeNode?, _ result: inout Bool) {
//        guard result == true else { return }
//
//        if left == nil && right == nil { return }
//
//        if (left == nil && right != nil) || (left != nil && right == nil) {
//            result = false
//            return
//        }
//
//        let left = left!
//        let right = right!
//
//        if left.val != right.val {
//            result = false
//            return
//        }
//
//        recursively(left.left, right.right, &result)
//        if result {
//            recursively(left.right, right.left, &result)
//        }
//    }
    
    // iteratively
    // 16 ms, faster than 76.49%
    // 20.5 MB, less than 100.00%
//    func isSymmetric(_ root: TreeNode?) -> Bool {
//        guard let root = root else { return true }
//        if root.left == nil && root.right == nil { return true }
//        if (root.left == nil && root.right != nil) || (root.left != nil && root.right == nil) {
//            return false
//        }
//        if root.left?.val != root.right?.val {
//            return false
//        }
//
//        var stackLeft: [TreeNode] = [root.left!]
//        var stackRight: [TreeNode] = [root.right!]
//        while !stackLeft.isEmpty && !stackRight.isEmpty {
//            let left_left = stackLeft.last?.left
//            let right_right = stackRight.last?.right
//
//            if compare(left_left, right_right) == false {
//                return false
//            }
//
//            let left_right = stackLeft.last?.right
//            let right_left = stackRight.last?.left
//
//            if compare(left_right, right_left) == false {
//                return false
//            }
//
//            stackLeft.removeLast()
//            stackRight.removeLast()
//            if left_left != nil && right_right != nil {
//                stackLeft.append(left_left!)
//                stackRight.append(right_right!)
//            }
//            if left_right != nil && right_left != nil {
//                stackLeft.append(left_right!)
//                stackRight.append(right_left!)
//            }
//        }
//        return true
//    }
//
//    private func compare(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
//        if left == nil && right == nil {
//            return true
//        }
//        if (left != nil && right == nil) || (left == nil && right != nil) {
//            return false
//        }
//        if left!.val != right!.val {
//            return false
//        }
//        return true
//    }
    
    // 16 ms, faster than 76.49%
    // 20.5 MB, less than 100.00%
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return compare(root, root)
    }
    
    private func compare(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil && right == nil { return true }
        if left == nil || right == nil { return false }
        if left?.val != right?.val { return false }
        return compare(left?.left, right?.right) && compare(left?.right, right?.left)
    }
}

var node = TreeNode(1)
node.left = TreeNode(2)
node.left?.left = TreeNode(3)
node.left?.right = TreeNode(4)
node.right = TreeNode(2)
node.right?.left = TreeNode(4)
node.right?.right = TreeNode(3)
Solution().isSymmetric(node) // true

node = TreeNode(1)
node.left = TreeNode(2)
node.left?.right = TreeNode(3)
node.right = TreeNode(2)
node.right?.right = TreeNode(3)
Solution().isSymmetric(node) // false
