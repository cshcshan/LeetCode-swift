/*
 
 Given an array nums of n integers where n > 1,  return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].
 
 # Example:
 
 Input:  [1,2,3,4]
 Output: [24,12,8,6]
 
 Note: Please solve it without division and in O(n).
 
 Follow up:
 Could you solve it with constant space complexity? (The output array does not count as extra space for the purpose of space complexity analysis.)
 
 */

class Solution {
    // !!!
    // 96 ms, faster than 95.36%
    // 24.3 MB, less than 100.00%
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else { return nums }
        var result = [Int](repeating: 1, count: nums.count)
        var left = 1
        var right = 1
        for index in 1..<nums.count { // skip the first element
            left *= nums[index - 1]
            result[index] = left
        }
        for index in stride(from: nums.count - 2, through: 0, by: -1) { // skip the last element
            right *= nums[index + 1]
            result[index] *= right
        }
        return result
    }
}

Solution().productExceptSelf([1,2,3,4]) // [24, 12, 8, 6]
Solution().productExceptSelf([2,3,4,5]) // [60, 40, 30, 24]

/*
 after first for loop
 result = [1, nums[0], {nums[0]} * nums[1], {nums[0] * nums[1]} * nums[2]]
        = [1,    2   ,    {2}    *    3   , {        6        } *    4   ]
        = [1, 2, 6, 24]
 after second for loop
 result = [{1}, {nums[0]}, {nums[0] * nums[1]}, {nums[0] * nums[1] * nums[2]}]
        = [{1} * <nums[3] * nums[2]> * nums[1], {nums[0]} * <nums[3]> * nums[2], {nums[0] * nums[1]} * nums[3], {nums[0] * nums[1] * nums[2]}]
        = [5 * 4 * 3, 2 * 5 * 4, 2 * 3 * 5, 2 * 3 * 4]
        = [60, 40, 30, 24]
 */
