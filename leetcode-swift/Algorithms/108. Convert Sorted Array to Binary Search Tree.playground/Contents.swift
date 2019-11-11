/*
 
 Given an array where elements are sorted in ascending order, convert it to a height balanced BST.
 
 For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
 
 # Example:
 
 Given the sorted array: [-10,-3,0,5,9],
 
 One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:
 
         0
        / \
      -3   9
      /   /
    -10  5
 
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
    // 68 ms, faster than 37.55%
    // 22.2 MB, less than 33.33%
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        guard nums.count > 0 else { return nil }
        let mid = nums.count / 2
        let node = TreeNode(nums[mid])
        if mid > 0 {
            node.left = sortedArrayToBST(Array(nums[0..<mid]))
        }
        if mid < nums.count {
            node.right = sortedArrayToBST(Array(nums[mid+1..<nums.count]))
        }
        return node
    }
}

func printNode(_ node: TreeNode?, leftRight: String) {
    guard let node = node else { return }
    print("value: \(node.val) [\(leftRight)]")
    if let left = node.left {
        print(" - left: \(left.val)")
    }
    if let right = node.right {
        print(" - right: \(right.val)")
    }
    printNode(node.left, leftRight: "\(leftRight) > Left")
    printNode(node.right, leftRight: "\(leftRight) > Right")
}

var node = Solution().sortedArrayToBST([])
printNode(node, leftRight: "Root")

node = Solution().sortedArrayToBST([1])
printNode(node, leftRight: "Root")

node = Solution().sortedArrayToBST([-10,-3,0,5,9])
printNode(node, leftRight: "Root")

node = Solution().sortedArrayToBST([-10,-3,0,1,5,9]) // [0,-3,9,-10,null,5]
printNode(node, leftRight: "Root")
