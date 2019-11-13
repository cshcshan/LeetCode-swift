/*
 
 Given inorder and postorder traversal of a tree, construct the binary tree.
 
 Note:
 You may assume that duplicates do not exist in the tree.
 
 For example, given
 
 inorder = [9,3,15,20,7]
 postorder = [9,15,7,20,3]
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
    // 2648 ms, faster than 12.07%
    // 92.5 MB, less than 100.00%
//    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
//        guard inorder.count > 0 && postorder.count > 0 else { return nil }
//        guard inorder.count > 1 && postorder.count > 1 else { return TreeNode(inorder[0]) }
//        let root = postorder.last!
//        let node = TreeNode(root)
//        let indexOfRoot = findIndex(of: root, in: inorder)
//        if indexOfRoot > 0 {
//            node.left = buildTree(Array(inorder[0..<indexOfRoot]), Array(postorder[0..<indexOfRoot]))
//        }
//        if indexOfRoot + 1 < inorder.count {
//            node.right = buildTree(Array(inorder[indexOfRoot+1..<inorder.count]), Array(postorder[indexOfRoot..<postorder.count-1]))
//        }
//        return node
//    }
//
//    private func findIndex(of target: Int, in inorder: [Int]) -> Int {
//        for index in 0..<inorder.count {
//            if target == inorder[index] {
//                return index
//            }
//        }
//        return 0
//    }
    
    // 2860 ms, faster than 8.62%
    // 92.8 MB, less than 100.00%
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        guard inorder.count > 0 && postorder.count > 0 else { return nil }
        guard inorder.count > 1 && postorder.count > 1 else { return TreeNode(inorder[0]) }
        let root = postorder.last!
        let node = TreeNode(root)
        let indexOfRoot = findIndex(of: root, in: inorder)
        if indexOfRoot > 0 {
            node.left = buildTree(Array(inorder[0..<indexOfRoot]), Array(postorder[0..<indexOfRoot]))
        }
        if indexOfRoot + 1 < inorder.count {
            node.right = buildTree(Array(inorder[indexOfRoot+1..<inorder.count]), Array(postorder[indexOfRoot..<postorder.count-1]))
        }
        return node
    }
    
    private func findIndex(of target: Int, in inorder: [Int]) -> Int {
        let mid = inorder.count / 2
        for index in stride(from: mid, through: 0, by: -1) {
            if target == inorder[index] {
                return index
            }
            if mid == index {
                continue
            }
            if target == inorder[mid + (mid - index)] {
                return mid + (mid - index)
            }
        }
        return -1
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

var node = Solution().buildTree([9,3,15,20,7], [9,15,7,20,3])
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

node = Solution().buildTree([3,2,1],[3,2,1])
node = Solution().buildTree([2,1],[2,1])

node = Solution().buildTree([8,4,9,2,10,5,11,1,12,6,13,3,14,7,15],[8,9,4,10,11,5,2,12,13,6,14,15,7,3,1])
printNode(node, leftRight: "Root")
