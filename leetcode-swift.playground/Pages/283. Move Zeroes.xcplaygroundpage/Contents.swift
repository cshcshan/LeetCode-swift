/*
 
 Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
 
 # Example:
 
 Input: [0,1,0,3,12]
 Output: [1,3,12,0,0]
 
 Note:
 
 You must do this in-place without making a copy of the array.
 Minimize the total number of operations.
 
 */

class Solution {
    // 40 ms, faster than 87.65%
    //    // 21.4 MB, less than 6.25%
    //    func moveZeroes(_ nums: inout [Int]) {
    //        var index = nums.count - 1
    //        while index >= 0 {
    //            let num = nums[index]
    //            if num == 0 {
    //                nums.remove(at: index)
    //                nums.append(num)
    //            }
    //            index -= 1
    //        }
    //    }
    
    // 44 ms, faster than 49.74%
    // 21.5 MB, less than 6.25%
    func moveZeroes(_ nums: inout [Int]) {
        var k = 0
        for index in 0..<nums.count {
            if nums[index] != 0 {
                nums[k] = nums[index]
                k += 1
            }
        }
        for index in k..<nums.count {
            nums[index] = 0
        }
    }
}

var nums = [0,1,0,3,12]
Solution().moveZeroes(&nums) // [1,3,12,0,0]
nums = []
Solution().moveZeroes(&nums)
nums = [0]
Solution().moveZeroes(&nums)
nums = [0,0]
Solution().moveZeroes(&nums)
nums = [0,1]
Solution().moveZeroes(&nums)
nums = [1,0]
Solution().moveZeroes(&nums)
nums = [1,1]
Solution().moveZeroes(&nums)
