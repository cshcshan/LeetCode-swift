/*
 
 Given an array nums containing n + 1 integers where each integer is between 1 and n (inclusive), prove that at least one duplicate number must exist. Assume that there is only one duplicate number, find the duplicate one.

 # Example 1:

 Input: [1,3,4,2,2]
 Output: 2
 
 # Example 2:

 Input: [3,1,3,4,2]
 Output: 3
 
 Note:

 You must not modify the array (assume the array is read only).
 You must use only constant, O(1) extra space.
 Your runtime complexity should be less than O(n2).
 There is only one duplicate number in the array, but it could be repeated more than once.
 
 */

class Solution {
    // 1960 ms, faster than 5.55%
    // 21.2 MB, less than 100.00%
//    func findDuplicate(_ nums: [Int]) -> Int {
//        for i in 0..<nums.count-1 {
//            for j in i+1..<nums.count {
//                if nums[i] == nums[j] {
//                    return nums[i]
//                }
//            }
//        }
//        return 0
//    }
    
    // 60 ms, faster than 59.52%
    // 21.2 MB, less than 100.00%
//    func findDuplicate(_ nums: [Int]) -> Int {
//        var array = [Int](repeating: -1, count: nums.count)
//        for num in nums {
//            if array[num - 1] == 0 {
//                return num
//            } else {
//                array[num - 1] = 0
//            }
//        }
//        return 0
//    }
    
    // !!!
    // 100 ms, faster than 26.98%
    // 21.1 MB, less than 100.00%
//    func findDuplicate(_ nums: [Int]) -> Int {
//        var left = 0
//        var right = nums.count - 1
//        while left < right {
//            var count = 0
//            let mid = (left + right) / 2
//            // 迴圈尋找 nums，如果裡面數字小於 mid 則 count++
//            for num in nums {
//                if num <= mid {
//                    count += 1
//                }
//            }
//            // 如果 count <= mid，表示左側正常無重複，所以去右邊找重複的
//            // 反之，則是右邊正常無重複，去左邊找重複的
//            if count <= mid {
//                left = mid + 1
//            } else {
//                right = mid
//            }
//        }
//        return right
//    }
    
    // !!!
    // https://blog.csdn.net/monkeyduck/article/details/50439840
    // https://blog.csdn.net/wr339988/article/details/53617914
    // 48 ms, faster than 100.00%
    // 21.2 MB, less than 100.00%
    func findDuplicate(_ nums: [Int]) -> Int {
        /*
         
         因為 1~n 之間有 n+1 個數字，所以一定有重複的數字出現
         將陣列想像成一條線和一個圓圈，而重複的數字就是圓圈跟線交會的點
         
         (因為有重複的元素，所以一定有兩個以上 index 指向同一個數字
         這就會造成多次 loop 後，快慢針一定會進入一個循環中
         在圓圈上以不同速度的兩個指針一定會在某個位置上相遇)
         
         (142. Linked List Cycle II)
         然後設定兩個指針，快針與慢針
         一個快針一次走兩步，一個慢針一次走一步
         
         當兩針第一次相遇時，讓快針回到原點0，且也變成一次走一步，慢針依然一次走一步
         再次交會時就是圓圈跟線交會的點
         
         */
        
        var slow = 0
        var fast = 0
        while true {
            // slow by one step and fast by two steps
            slow = nums[slow]
            fast = nums[nums[fast]]
            if slow == fast {
                break
            }
        }
        fast = 0
        while true {
            slow = nums[slow]
            fast = nums[fast]
            if slow == fast {
                break
            }
        }
        return slow
    }
}

Solution().findDuplicate([1,1]) // 1
Solution().findDuplicate([1,3,4,2,2]) // 2
Solution().findDuplicate([3,1,3,4,2]) // 3
