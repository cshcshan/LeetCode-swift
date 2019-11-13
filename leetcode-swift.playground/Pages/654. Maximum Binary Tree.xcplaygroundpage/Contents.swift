/*
 
 Given an integer array with no duplicates. A maximum tree building on this array is defined as follow:
 
 The root is the maximum number in the array.
 The left subtree is the maximum tree constructed from left part subarray divided by the maximum number.
 The right subtree is the maximum tree constructed from right part subarray divided by the maximum number.
 Construct the maximum tree by the given array and output the root node of this tree.
 
 # Example 1:
 
 Input: [3,2,1,6,0,5]
 Output: return the tree root node representing the following tree:
 
    6
  /   \
 3     5
  \    /
   2  0
    \
     1
 
 Note:
 
 The size of the given array will be in the range [1,1000].
 
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
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        guard nums.count > 0 && nums.count < 1001 else {
            return nil
        }
        
        let maxNum = nums.max()
        let indexOfMax = nums.firstIndex(of: maxNum!)
        let left_Array = nums[0..<indexOfMax!]
        let right_Array = nums[indexOfMax!+1..<nums.count]
        
        let treeNode = TreeNode(nums.max()!)
        if left_Array.count > 0 {
            treeNode.left = constructMaximumBinaryTree(Array(left_Array))
        }
        if right_Array.count > 0 {
            treeNode.right = constructMaximumBinaryTree(Array(right_Array))
        }
        return treeNode
    }
}

Solution().constructMaximumBinaryTree([3,2,1,6,0,5])
Solution().constructMaximumBinaryTree([6,0,5])
Solution().constructMaximumBinaryTree([3,2,1,6])
