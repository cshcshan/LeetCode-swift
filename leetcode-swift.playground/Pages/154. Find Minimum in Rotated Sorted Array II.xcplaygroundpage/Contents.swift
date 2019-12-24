/*
 
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

 (i.e.,  [0,1,2,4,5,6,7] might become  [4,5,6,7,0,1,2]).

 Find the minimum element.

 The array may contain duplicates.

 # Example 1:

 Input: [1,3,5]
 Output: 1
 
 # Example 2:

 Input: [2,2,2,0,1]
 Output: 0
 
 Note:

 This is a follow up problem to Find Minimum in Rotated Sorted Array.
 Would allow duplicates affect the run-time complexity? How and why?
 
 */

class Solution {
    // 36 ms, faster than 63.64%
    // 20.9 MB, less than 100.00%
//    func findMin(_ nums: [Int]) -> Int {
//        var result = Int.max
//        for num in nums {
//            result = min(result, num)
//        }
//        return result
//    }
    
    // 32 ms, faster than 96.97%
    // 21.1 MB, less than 100.00%
    func findMin(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        
        // nums.count >= 1
        var leftIndex = 0
        var rightIndex = nums.count - 1
        while leftIndex < rightIndex {
            let mid = (leftIndex + rightIndex) / 2
            if nums[mid] < nums[rightIndex] {
                rightIndex = mid
            } else if nums[mid] > nums[rightIndex] {
                leftIndex = mid + 1
            } else {
                rightIndex -= 1
            }
        }
        return nums[leftIndex]
    }
}

Solution().findMin([3,3,3,3,3,3,3,3,1,3]) // 1

Solution().findMin([30,30,30,30]) // 30

Solution().findMin([30,30,10,30]) // 10
Solution().findMin([30,10,30,30]) // 10
Solution().findMin([10,30,30,30]) // 10
Solution().findMin([30,30,30,10]) // 10

Solution().findMin([10,30,10,10]) // 10
Solution().findMin([30,10,10,10]) // 10
Solution().findMin([10,10,10,30]) // 10
Solution().findMin([10,10,30,10]) // 10

Solution().findMin([30,10,10]) // 10
Solution().findMin([10,10,30]) // 10
Solution().findMin([10,30,10]) // 10

Solution().findMin([10,30,50]) // 10
Solution().findMin([50,10,30]) // 10
Solution().findMin([30,50,10]) // 10

Solution().findMin([20,20,20,0,10]) // 0
Solution().findMin([20,20,0,10,20]) // 0
Solution().findMin([20,0,10,20,20]) // 0
Solution().findMin([0,10,20,20,20]) // 0
Solution().findMin([10,20,20,20,0]) // 0

Solution().findMin([40,50,60,70,0,10,20]) // 0
