/*
 
 Given a binary tree, return the zigzag level order traversal of its nodes' values. (ie, from left to right, then right to left for the next level and alternate between).

 For example:
 Given binary tree [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 return its zigzag level order traversal as:

 [
   [3],
   [20,9],
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
    // 12 ms, faster than 81.20%
    // 20.8 MB, less than 33.33%
//    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
//        var result: [[Int]] = []
//        recursive(root, 0, &result)
//        for level in 0..<result.count {
//            if level % 2 == 1 {
//                result[level] = result[level].reversed()
//            }
//        }
//        return result
//    }
//
//    private func recursive(_ node: TreeNode?, _ level: Int, _ result: inout [[Int]]) {
//        guard let node = node else { return }
//        if level < result.count {
//            result[level].append(node.val)
//        } else {
//            result.append([node.val])
//        }
//        recursive(node.left, level + 1, &result)
//        recursive(node.right, level + 1, &result)
//    }
    
    // 12 ms, faster than 81.20%
    // 20.6 MB, less than 33.33%
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var result: [[Int]] = []
        var stack: [TreeNode] = [root]
        var nextStack: [TreeNode] = []
        var level = 0
        while !stack.isEmpty {
            let node = stack.popLast()!
            if level < result.count {
                result[level].append(node.val)
            } else {
                result.append([node.val])
            }
            if level % 2 == 0 {
                if let left = node.left {
                    nextStack.append(left)
                }
                if let right = node.right {
                    nextStack.append(right)
                }
            } else {
                if let right = node.right {
                    nextStack.append(right)
                }
                if let left = node.left {
                    nextStack.append(left)
                }
            }
            if stack.isEmpty {
                stack = nextStack
                nextStack.removeAll()
                level += 1
            }
        }
        return result
    }
}

var node = TreeNode(3)
node.left = TreeNode(9)
node.right = TreeNode(20)
node.right?.left = TreeNode(15)
node.right?.right = TreeNode(7)
Solution().zigzagLevelOrder(node) // [[3],[20,9],[15,7]]

node = TreeNode(1)
node.left = TreeNode(2)
node.right = TreeNode(3)
node.left?.left = TreeNode(4)
node.right?.right = TreeNode(5)
Solution().zigzagLevelOrder(node) // [[1],[3,2],[4,5]]
