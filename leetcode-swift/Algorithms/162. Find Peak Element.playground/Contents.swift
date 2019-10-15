/*
 
 A peak element is an element that is greater than its neighbors.
 
 Given an input array nums, where nums[i] ≠ nums[i+1], find a peak element and return its index.
 
 The array may contain multiple peaks, in that case return the index to any one of the peaks is fine.
 
 You may imagine that nums[-1] = nums[n] = -∞.
 
 # Example 1:
 Input: nums = [1,2,3,1]
 Output: 2
 Explanation: 3 is a peak element and your function should return the index number 2.
 
 # Example 2:
 Input: nums = [1,2,1,3,5,6,4]
 Output: 1 or 5
 Explanation: Your function can return either index number 1 where the peak element is 2,
 or index number 5 where the peak element is 6.
 
 Note:
 
 Your solution should be in logarithmic complexity.
 
 */

class Solution {
    // 24 ms, faster than 97.92%
    // 21 MB, less than 100.00%
    func findPeakElement(_ nums: [Int]) -> Int {
        var leftIndex = 0
        var rightIndex = nums.count - 1
        var index = (leftIndex + rightIndex) / 2
        while index >= leftIndex && index <= rightIndex {
            let num = nums[index]
            var leftNum = -1
            var rightNum = -1
            if index - 1 >= 0 {
                leftNum = nums[index - 1]
            }
            if index + 1 < nums.count {
                rightNum = nums[index + 1]
            }

            if num > leftNum && num > rightNum { return index }
            if rightNum > num {
                leftIndex = index + 1
                if leftIndex >= rightIndex {
                    return rightIndex
                }
            } else if leftNum > num {
                rightIndex = index - 1
                if rightIndex <= leftIndex {
                    return leftIndex
                }
            }
            index = (leftIndex + rightIndex) / 2
        }
        return 0
    }
}

Solution().findPeakElement([])
Solution().findPeakElement([0]) // 0
Solution().findPeakElement([0,1]) // 1
Solution().findPeakElement([1,0]) // 0
Solution().findPeakElement([1,2,3,1]) // 2
Solution().findPeakElement([1,2,1,3,5,6,4]) // 1 or 5
Solution().findPeakElement([1,2,3,4,5,6,5]) // 5
Solution().findPeakElement([1,2,3,4,5,6,7,6]) // 6
Solution().findPeakElement([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,14]) // 14
Solution().findPeakElement([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]) // 15
Solution().findPeakElement([1,2,1,2,3,1]) // 4
