/*
 
 Given preorder and inorder traversal of a tree, construct the binary tree.
 
 Note:
 You may assume that duplicates do not exist in the tree.
 
 For example, given
 
 preorder = [3,9,20,15,7]
 inorder = [9,3,15,20,7]
 Return the following binary tree:
 
      3
     / \
    9  20
      /  \
     15   7
 
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
    // 2680 ms, faster than 20.31%
    // 92.8 MB, less than 100.00%
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard preorder.count > 0 && inorder.count > 0 else { return nil }
        guard preorder.count > 1 && inorder.count > 1 else { return TreeNode(preorder[0]) }
        // preorder的第一個值為root
        // inorder 以 root 為中心，將 array 分成左右兩邊，左邊是 left node，右邊是 right node
        let root = preorder[0]
        let node = TreeNode(root)
        let indexOfRoot = findIndex(of: root, in: inorder)
        if indexOfRoot > 0 {
            node.left = buildTree(Array(preorder[1...indexOfRoot]), Array(inorder[0..<indexOfRoot]))
        }
        if indexOfRoot + 1 < inorder.count {
            node.right = buildTree(Array(preorder[indexOfRoot+1..<preorder.count]), Array(inorder[indexOfRoot+1..<inorder.count]))
        }
        return node
    }
    
    private func findIndex(of target: Int, in inorder: [Int]) -> Int {
        for index in 0..<inorder.count {
            if inorder[index] == target {
                return index
            }
        }
        return 0
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

var node = Solution().buildTree([3,9,20,15,7], [9,3,15,20,7])
//printNode(node, leftRight: "Root")

/*
 
            1
       /        \
      2          3
    /   \       /   \
   4     5     6     7
  / \   / \   / \   / \
 8   9 10 11 12 13 14 15
 
 */

node = Solution().buildTree([1,2,4,8,9,5,10,11,3,6,12,13,7,14,15], [8,4,9,2,10,5,11,1,12,6,13,3,14,7,15])
printNode(node, leftRight: "Root")
