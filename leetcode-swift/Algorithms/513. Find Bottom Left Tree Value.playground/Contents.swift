
/*
 
 Given a binary tree, find the leftmost value in the last row of the tree.
 
 # Example 1:
 
 Input:
 
   2
  / \
 1   3
 
 Output:
 1
 
 # Example 2:
 
 Input:
 
       1
      / \
     2   3
    /   / \
   4   5   6
  /
 7
 
 Output:
 7
 
 Note: You may assume the tree (i.e., the given root node) is not NULL.
 
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
    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        var level = 0
        var array = [Int]()
        recursive(root!, level: &level, array: &array)
        return array[array.count - 1]
    }
    
    func recursive(_ treeNode: TreeNode, level: inout Int, array: inout [Int]) {
        if array[level] == nil {
            print("aaa")
            array[level] = 0
        }
        array[level] = treeNode.val
        if let leftNode = treeNode.left {
            level += 1
            recursive(leftNode, level: &level, array: &array)
        }
    }
}
var treeNode = TreeNode(2)
treeNode.left = TreeNode(1)
treeNode.right = TreeNode(3)
Solution().findBottomLeftValue(treeNode)

var treeNode2 = TreeNode(1)
treeNode2.left = TreeNode(2)
treeNode2.right = TreeNode(3)
treeNode2.left!.left = TreeNode(4)
treeNode2.right!.left = TreeNode(5)
treeNode2.right!.right = TreeNode(6)
treeNode2.right!.left!.left = TreeNode(7)
Solution().findBottomLeftValue(treeNode2)

//[1,2,3,4,null,5,6,null,null,7]
