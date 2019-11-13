/*
 
 Reverse a singly linked list.
 
 # Example:
 
 Input: 1->2->3->4->5->NULL
 Output: 5->4->3->2->1->NULL
 
 Follow up:
 
 A linked list can be reversed either iteratively or recursively. Could you implement both?
 
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
    // 20 ms, faster than 27.66%
    // 22 MB, less than 14.29%
//    func reverseList(_ head: ListNode?) -> ListNode? {
//        // iteratively
//        guard let head = head else { return nil }
//        var result = ListNode(head.val)
//        var node = head.next
//        while (node != nil) {
//            let temp = result
//            result = ListNode(node!.val)
//            result.next = temp
//            node = node!.next
//        }
//        return result
//    }
    
    // 16 ms, faster than 84.13%
    // 22.1 MB, less than 14.29%
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        return recursively(head, parent: nil)
    }
    
    // !!!
    private func recursively(_ head: ListNode?, parent: ListNode?) -> ListNode? {
        guard let head = head else { return parent }
        let next = head.next
        head.next = parent
        return recursively(next, parent: head)
    }
}

func printNode(_ node: ListNode?) {
    guard let node = node else { return }
    print("value: \(node.val)")
    if let next = node.next {
        print(" - next: \(next.val)")
    }
    printNode(node.next)
}


let ln = ListNode(1)
ln.next = ListNode(2)
ln.next?.next = ListNode(3)
ln.next?.next?.next = ListNode(4)
ln.next?.next?.next?.next = ListNode(5)
let node = Solution().reverseList(ln)
printNode(node)
