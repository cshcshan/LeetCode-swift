/*
 
 Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.
 
 Example:
 
 Input: 1->2->4, 1->3->4
 Output: 1->1->2->3->4->4
 
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    // *** 16 ms / 20.7 MB ***
//    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//        guard let l1 = l1 else { return l2 }
//        guard let l2 = l2 else { return l1 }
//
//        var resultNode: ListNode
//        if l1.val <= l2.val {
//            resultNode = ListNode(l1.val)
//
//            if let l1next = l1.next {
//                let newl1Node = ListNode(l1next.val)
//                newl1Node.next = l1next.next
//                resultNode.next = mergeTwoLists(newl1Node, l2)
//            } else {
//                resultNode.next = l2
//            }
//        } else {
//            resultNode = ListNode(l2.val)
//
//            if let l2next = l2.next {
//                let newl2Node = ListNode(l2next.val)
//                newl2Node.next = l2next.next
//                resultNode.next = mergeTwoLists(l1, newl2Node)
//            } else {
//                resultNode.next = l1
//            }
//        }
//        return resultNode
//    }
    
    // *** 8 ms / 21 MB ***
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else { return l2 }
        guard let l2 = l2 else { return l1 }

        if l1.val < l2.val {
            l1.next = mergeTwoLists(l1.next, l2)
            return l1
        } else {
            l2.next = mergeTwoLists(l1, l2.next)
            return l2
        }
    }
}

var l1 = ListNode(1)
l1.next = ListNode(2)
l1.next!.next = ListNode(4)

var l2 = ListNode(1)
l2.next = ListNode(3)
l2.next!.next = ListNode(4)

let node = Solution().mergeTwoLists(l1, l2)
print(node!.val)
print(node!.next!.val)
print(node!.next!.next!.val)
print(node!.next!.next!.next!.val)
print(node!.next!.next!.next!.next!.val)
print(node!.next!.next!.next!.next!.next!.val)

