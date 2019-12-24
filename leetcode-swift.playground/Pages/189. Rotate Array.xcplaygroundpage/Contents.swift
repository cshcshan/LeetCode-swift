/*
 
 Given an array, rotate the array to the right by k steps, where k is non-negative.

 # Example 1:

 Input: [1,2,3,4,5,6,7] and k = 3
 Output: [5,6,7,1,2,3,4]
 
 Explanation:
 rotate 1 steps to the right: [7,1,2,3,4,5,6]
 rotate 2 steps to the right: [6,7,1,2,3,4,5]
 rotate 3 steps to the right: [5,6,7,1,2,3,4]
 
 # Example 2:

 Input: [-1,-100,3,99] and k = 2
 Output: [3,99,-1,-100]
 
 Explanation:
 rotate 1 steps to the right: [99,-1,-100,3]
 rotate 2 steps to the right: [3,99,-1,-100]
 
 Note:

 Try to come up as many solutions as you can, there are at least 3 different ways to solve this problem.
 Could you do it in-place with O(1) extra space?
 
 */

class Solution {
    // 72 ms, faster than 20.09%
    // 21.1 MB, less than 50.00%
//    func rotate(_ nums: inout [Int], _ k: Int) {
//        for time in 0..<k {
//            let last = nums.removeLast()
//            nums.insert(last, at: 0)
//        }
//    }
    
    // 68 ms, faster than 33.33%
    // 21.4 MB, less than 50.00%
//    func rotate(_ nums: inout [Int], _ k: Int) {
//        for time in 0..<(k%nums.count) {
//            let last = nums.removeLast()
//            nums.insert(last, at: 0)
//        }
//    }
    
    // !!!
    // 40 ms, faster than 75.89%
    // 22.1 MB, less than 50.00%
//    func rotate(_ nums: inout [Int], _ k: Int) {
//        let numsCount = nums.count
//        let times = k % numsCount // !!!
//        let lastPart = nums[numsCount - times..<numsCount]
//        nums.removeLast(times)
//        nums = lastPart + nums
//    }
    
    // 44 ms, faster than 56.03%
    // 22 MB, less than 50.00%
//    func rotate(_ nums: inout [Int], _ k: Int) {
//        let numsCount = nums.count
//        let times = k % numsCount // !!!
//        nums = Array(nums[(numsCount - times)..<numsCount]) + Array(nums[0..<(numsCount - times)])
//    }
    
    // !!!
    // 36 ms, faster than 95.04%
    // 20.9 MB, less than 50.00%
    func rotate(_ nums: inout [Int], _ k: Int) {
        let times = k % nums.count
        reverse(&nums, 0, nums.count - 1)
        reverse(&nums, 0, times - 1)
        reverse(&nums, times, nums.count - 1)
    }
    
    private func reverse(_ nums: inout [Int], _ start: Int, _ end: Int) {
        var left = start
        var right = end
        while left < right {
            let temp = nums[left]
            nums[left] = nums[right]
            nums[right] = temp
            left += 1
            right -= 1
        }
    }
}

var nums = [-1]
Solution().rotate(&nums, 2)
print(nums)

nums = [1,2,3,4,5,6,7]
Solution().rotate(&nums, 3)
print(nums) // [5,6,7,1,2,3,4]

nums = [-1,-100,3,99]
Solution().rotate(&nums, 2)
print(nums) // [3,99,-1,-100]

nums = [-1,-100,3,99]
Solution().rotate(&nums, 0)
print(nums)
