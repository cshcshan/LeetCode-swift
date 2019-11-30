/*
 
 Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).
 
 # For example:
 
 Given binary tree [3,9,20,null,null,15,7],
 
     3
    / \
   9  20
     /  \
    15   7
 
 return its level order traversal as:
 
 [
    [3],
    [9,20],
    [15,7]
 ]
 
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
    // 16 ms, faster than 83.08%
    // 21.3 MB, less than 50.00%
//    func levelOrder(_ root: TreeNode?) -> [[Int]] {
//        var result: [[Int]] = []
//        recursively(root, &result, 0)
//        return result
//    }
//
//    private func recursively(_ node: TreeNode?, _ result: inout [[Int]], _ level: Int) {
//        guard let node = node else { return }
//        if level < result.count {
//            result[level].append(node.val)
//        } else {
//            result.append([node.val])
//        }
//        recursively(node.left, &result, level + 1)
//        recursively(node.right, &result, level + 1)
//    }
    
    // 16 ms, faster than 83.08%
    // 20.9 MB, less than 50.00%
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var result: [[Int]] = [[root.val]]
        var stack: [TreeNode] = [root]
        while !stack.isEmpty {
            var tempStack: [TreeNode] = []
            var tempArray: [Int] = []
            for node in stack {
                if let left = node.left {
                    tempArray.append(left.val)
                    tempStack.append(left)
                }
                if let right = node.right {
                    tempArray.append(right.val)
                    tempStack.append(right)
                }
            }
            if tempArray.count > 0 {
                result.append(tempArray)
            }
            stack.removeAll()
            stack = tempStack
        }
        return result
    }
}

var node = TreeNode(3)
node.left = TreeNode(9)
node.right = TreeNode(20)
node.right?.left = TreeNode(15)
node.right?.right = TreeNode(7)
Solution().levelOrder(node)
/*
 [
    [3],
    [9,20],
    [15,7]
 ]
 */

node = TreeNode(1)
node.left = TreeNode(2)
node.left?.left = TreeNode(4)
node.left?.right = TreeNode(5)
node.right = TreeNode(3)
Solution().levelOrder(node)
/*
 [
    [1],
    [2,3],
    [4,5]
 ]
 */
