/*
 
 Given a singly linked list, group all odd nodes together followed by the even nodes. Please note here we are talking about the node number and not the value in the nodes.

 You should try to do it in place. The program should run in O(1) space complexity and O(nodes) time complexity.

 # Example 1:

 Input: 1->2->3->4->5->NULL
 Output: 1->3->5->2->4->NULL
 
 # Example 2:

 Input: 2->1->3->5->6->4->7->NULL
 Output: 2->3->6->7->1->5->4->NULL
 
 Note:

 The relative order inside both the even and odd groups should remain as it was in the input.
 The first node is considered odd, the second node even and so on ...
 
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
    // 32 ms, faster than 70.53%
    // 21.7 MB, less than 100.00%
//    func oddEvenList(_ head: ListNode?) -> ListNode? {
//        guard let head = head else { return nil }
//        var node: ListNode? = head
//        var headOdd: ListNode?, tailOdd: ListNode?
//        var headEven: ListNode?, tailEven: ListNode?
//        var count = 0
//        while node != nil {
//            if count % 2 == 0 {
//                if headOdd == nil {
//                    headOdd = node
//                    tailOdd = node
//                } else {
//                    tailOdd?.next = node
//                    tailOdd = tailOdd?.next
//                }
//                node = node!.next
//                tailOdd?.next = nil
//            } else {
//                if headEven == nil {
//                    headEven = node
//                    tailEven = node
//                } else {
//                    tailEven?.next = node
//                    tailEven = tailEven?.next
//                }
//                node = node!.next
//                tailEven?.next = nil
//            }
//            count += 1
//        }
//        tailOdd?.next = headEven
//        return headOdd
//    }
    
    // !!!
    // 28 ms, faster than 96.84%
    // 21.6 MB, less than 100.00%
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var node = head
        var next = node?.next // 以 next 來 track 所有節點
        var tailOdd: ListNode?
        let headEven = head?.next
        var isOdd = true
        dummy.next = node
        while node != nil {
            node?.next = node?.next?.next // 消掉 next，直接接下下個 node
            if isOdd {
                tailOdd = node
            }
            node = next
            next = node?.next
            isOdd = !isOdd
        }
        tailOdd?.next = headEven
        return dummy.next
    }
}

func printNode(_ node: ListNode?) {
//    guard let node = node else { return }
//    print("value: \(node.val)")
//    if let next = node.next {
//        print(" - next: \(next.val)")
//    }
//    printNode(node.next)
    var node = node
    var count = 100
    while node != nil && count > 0 {
        print("value: \(node!.val)")
        if let next = node?.next {
            print(" - next: \(next.val)")
        }
        node = node?.next
        count -= 1
    }
}

var node = Solution().oddEvenList(nil)
//printNode(node)

var ln = ListNode(1)
node = Solution().oddEvenList(ln)
//printNode(node)
ln.next = ListNode(2)
ln.next?.next = ListNode(3)
ln.next?.next?.next = ListNode(4)
ln.next?.next?.next?.next = ListNode(5)
ln.next?.next?.next?.next?.next = ListNode(6)
ln.next?.next?.next?.next?.next?.next = ListNode(7)
node = Solution().oddEvenList(ln)
printNode(node)
