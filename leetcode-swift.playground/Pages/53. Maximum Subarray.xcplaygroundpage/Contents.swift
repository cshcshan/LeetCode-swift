/*

 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
 
 # Example:
 
 Input: [-2,1,-3,4,-1,2,1,-5,4],
 Output: 6
 
 Explanation: [4,-1,2,1] has the largest sum = 6.
 
 Follow up:
 
 If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.
 
 */

class Solution {
    // 48 ms, faster than 21.88%
    // 20.8 MB, less than 16.67%
//    func maxSubArray(_ nums: [Int]) -> Int {
//        guard nums.count > 0 else { return 0 }
//        var adding = nums[0]
//        var result = nums[0]
//        for (index, num) in nums.enumerated() {
//            guard index > 0 else { continue }
//            if num > 0 {
//                adding = max(num, num + adding)
//            } else {
//                if result > 0 {
//                    adding += num
//                } else {
//                    adding = max(num, adding)
//                }
//            }
//            result = max(adding, result)
//        }
//        return result
//    }
    
    // 32 ms, faster than 99.72%
    // 20.8 MB, less than 16.67%
    func maxSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var nums = nums
        var result = nums[0]
        for index in 1..<nums.count {
            nums[index] = max(nums[index], nums[index] + nums[index - 1])
            result = max(result, nums[index])
        }
        return result
    }
}

Solution().maxSubArray([-2,1,-3,4,-1,2,1,-5,4]) // 6
Solution().maxSubArray([-2,-1]) // -1
Solution().maxSubArray([-1]) // -1
Solution().maxSubArray([1,2,-2,1]) // 3
Solution().maxSubArray([1,2,-2,3]) // 4
