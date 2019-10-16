/*
 
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
 
 (i.e.,  [0,1,2,4,5,6,7] might become  [4,5,6,7,0,1,2]).
 
 Find the minimum element.
 
 You may assume no duplicate exists in the array.
 
 # Example 1:
 Input: [3,4,5,1,2]
 Output: 1
 
 # Example 2:
 Input: [4,5,6,7,0,1,2]
 Output: 0
 
 */

class Solution {
    // 16 ms, faster than 97.04%
    // 20.8 MB, less than 100.00%
//    func findMin(_ nums: [Int]) -> Int {
//        guard nums.count > 0 else { return 0 }
//        guard nums.count > 1 else { return nums[0] }
//        guard nums.count > 2 else { return min(nums[0], nums[1]) }
//
//        var result = Int.max
//        for num in nums {
//            result = min(result, num)
//        }
//        return result
//    }
    
    // 20 ms, faster than 69.82%
    // 21 MB, less than 100.00%
//    func findMin(_ nums: [Int]) -> Int {
//        guard nums.count > 0 else { return 0 }
//        guard nums.count > 1 else { return nums[0] }
//        guard nums.count > 2 else { return min(nums[0], nums[1]) }
//
//        // nums.count >= 3
//        var leftIndex = 0
//        var rightIndex = nums.count - 1
//        var index = (leftIndex + rightIndex) / 2
//        while index >= leftIndex && index <= rightIndex {
//            let num = nums[index]
//            if index - 1 < 0 {
//                return min(num, nums[index + 1])
//            }
//            if index + 1 >= nums.count {
//                return min(num, nums[index - 1])
//            }
//            if num < nums[index - 1] && num < nums[index + 1] {
//                return num
//            }
//
//            if num > nums[rightIndex] {
//                leftIndex = index + 1
//                if leftIndex >= rightIndex {
//                    return nums[rightIndex]
//                }
//            } else {
//                rightIndex = index - 1
//                if rightIndex <= leftIndex {
//                    return nums[leftIndex]
//                }
//            }
//            index = (leftIndex + rightIndex) / 2
//        }
//        return 0
//    }
    
    // 20 ms, faster than 69.82%
    // 20.7 MB, less than 100.00%
//    func findMin(_ nums: [Int]) -> Int {
//        guard nums.count > 0 else { return 0 }
//        guard nums.count > 1 else { return nums[0] }
//
//        // nums.count >= 2
//        var leftIndex = 0
//        var rightIndex = nums.count - 1
//        var index = (leftIndex + rightIndex) / 2
//        while index >= leftIndex && index <= rightIndex {
//            if leftIndex + 1 == rightIndex {
//                return min(nums[leftIndex], nums[rightIndex])
//            }
//
//            let num = nums[index]
//            let leftNum = nums[leftIndex]
//            let rightNum = nums[rightIndex]
//            if leftNum < num && num < rightNum { return leftNum }
//
//            if num > rightNum {
//                leftIndex = index
//            } else {
//                rightIndex = index
//                if leftIndex + 1 == rightIndex {
//                    return min(nums[leftIndex], nums[rightIndex])
//                }
//            }
//            index = (leftIndex + rightIndex) / 2
//        }
//        return nums[index]
//    }
    
    // 20 ms, faster than 69.82%
    // 20.9 MB, less than 100.00%
    func findMin(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        
        // nums.count >= 1
        var leftIndex = 0
        var rightIndex = nums.count - 1
        while leftIndex < rightIndex {
            let mid = (leftIndex + rightIndex) / 2
            if nums[mid] < nums[rightIndex] {
                rightIndex = mid
            } else {
                leftIndex = mid + 1
            }
        }
        return nums[leftIndex]
    }
}

Solution().findMin([10,30]) // 10
Solution().findMin([30,10]) // 10

Solution().findMin([10,30,50]) // 10
Solution().findMin([50,10,30]) // 10
Solution().findMin([30,50,10]) // 10

Solution().findMin([10,30,50,70]) // 10
Solution().findMin([30,50,70,10]) // 10
Solution().findMin([50,70,10,30]) // 10
Solution().findMin([70,10,30,50]) // 10

Solution().findMin([30,40,50,60,70,10,20]) // 10
Solution().findMin([40,50,60,70,10,20,30]) // 10
Solution().findMin([50,60,70,10,20,30,40]) // 10
Solution().findMin([60,70,10,20,30,40,50]) // 10
Solution().findMin([70,10,20,30,40,50,60]) // 10
Solution().findMin([10,20,30,40,50,60,70]) // 10
Solution().findMin([20,30,40,50,60,70,10]) // 10
