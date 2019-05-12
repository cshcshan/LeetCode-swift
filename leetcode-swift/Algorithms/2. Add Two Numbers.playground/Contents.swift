/*
 
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 # Example:
 
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 Explanation: 342 + 465 = 807.
 
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
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else { return l2 }
        guard let l2 = l2 else { return l1 }
        let reminder = (l1.val + l2.val) % 10
        print("l1: \(l1.val), l2: \(l2.val), reminder: \(reminder)")
        let newNode = ListNode(reminder)
        if l1.val + l2.val > 9 {
            newNode.next = addTwoNumbers(addTwoNumbers(l1.next, l2.next), ListNode(1))
        } else {
            newNode.next = addTwoNumbers(l1.next, l2.next)
        }
        return newNode
    }
}

var l1 = ListNode(2)
l1.next = ListNode(4)
l1.next!.next = ListNode(3)

var l2 = ListNode(5)
l2.next = ListNode(6)
l2.next!.next = ListNode(4)

Solution().addTwoNumbers(l1, l2)
