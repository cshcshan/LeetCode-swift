/*
 
 Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
 
 You may assume no duplicates in the array.
 
 # Example 1:
 
 Input: [1,3,5,6], 5
 Output: 2
 
 # Example 2:
 
 Input: [1,3,5,6], 2
 Output: 1
 
 # Example 3:
 
 Input: [1,3,5,6], 7
 Output: 4
 
 # Example 4:
 
 Input: [1,3,5,6], 0
 Output: 0
 
 */

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        
        for index in 0..<nums.count {
            if target <= nums[index] {
                return index
            }
        }
        
        return nums.count
    }
}
Solution().searchInsert([1,3,5,6], 5)
Solution().searchInsert([1,3,5,6], 2)
Solution().searchInsert([1,3,5,6], 7)
Solution().searchInsert([1,3,5,6], 0)

/*
 [1,3,5,6], 5 → 2
 [1,3,5,6], 2 → 1
 [1,3,5,6], 7 → 4
 [1,3,5,6], 0 → 0
 */
