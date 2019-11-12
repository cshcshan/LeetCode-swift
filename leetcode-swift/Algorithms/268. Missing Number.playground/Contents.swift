/*
 
 Given an array containing n distinct numbers taken from 0, 1, 2, ..., n, find the one that is missing from the array.
 
 # Example 1:
 
 Input: [3,0,1]
 Output: 2
 
 # Example 2:
 
 Input: [9,6,4,2,3,5,7,0,1]
 Output: 8
 
 Note:
 Your algorithm should run in linear runtime complexity. Could you implement it using only constant extra space complexity?
 
 */

class Solution {
    // 276 ms, faster than 12.41%
    // 21.5 MB, less than 50.00%
//    func missingNumber(_ nums: [Int]) -> Int {
//        guard nums.count > 0 else { return 0 }
//        var sorted = nums.sorted(by: <)
//        for index in 0..<sorted.count {
//            if sorted[index] != index {
//                return index
//            }
//        }
//        return nums.count
//    }
    
    // !!! XOR a^b^b = a
    // 136 ms, faster than 98.62%
    // 21 MB, less than 50.00%
    func missingNumber(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var result = nums.count
        for index in 0..<nums.count {
            result ^= index
            result ^= nums[index]
        }
        return result
    }
}

Solution().missingNumber([0]) // 1
Solution().missingNumber([3,0,1]) // 2
Solution().missingNumber([9,6,4,2,3,5,7,0,1]) // 8
Solution().missingNumber([8,6,4,2,3,5,7,0,1]) // 9
