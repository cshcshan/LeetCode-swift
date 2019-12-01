/*
 
 Given a singly linked list, determine if it is a palindrome.

 # Example 1:

 Input: 1->2
 Output: false
 
 # Example 2:

 Input: 1->2->2->1
 Output: true
 
 Follow up:
 Could you do it in O(n) time and O(1) space?
 
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
    // 108 ms, faster than 32.11%
    // 29.7 MB, less than 100.00%
//    func isPalindrome(_ head: ListNode?) -> Bool {
//        guard let head = head else { return true }
//        var array: [Int] = [head.val]
//        var node = head
//        while node.next != nil {
//            node = node.next!
//            array.append(node.val)
//        }
//        for index in 0..<array.count/2 {
//            if array[index] != array[(array.count - 1) - index] {
//                return false
//            }
//        }
//        return true
//    }
    
    // !!!
    // 92 ms, faster than 95.12%
    // 25.7 MB, less than 100.00%
    func isPalindrome(_ head: ListNode?) -> Bool {
        var fast = head
        var slow = head
        var head = head
        while fast != nil && fast!.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        var rev = reverse(slow)
        while rev != nil && head != nil {
            if rev?.val != head?.val {
                return false
            }
            head = head?.next
            rev = rev?.next
        }
        return true
    }
    
    private func reverse(_ head: ListNode?) -> ListNode? {
        var pre: ListNode?
        var cur = head
        while cur != nil {
            let next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        return pre
    }
}

var node = ListNode(1)
node.next = ListNode(2)
node.next?.next = ListNode(2)
node.next?.next?.next = ListNode(1)
Solution().isPalindrome(node)
