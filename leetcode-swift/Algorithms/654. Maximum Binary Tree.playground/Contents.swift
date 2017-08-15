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
    let indexOfMax = nums.index(of: maxNum!)
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
