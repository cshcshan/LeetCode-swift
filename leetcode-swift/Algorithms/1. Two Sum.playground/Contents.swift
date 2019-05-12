/*
 
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
 # Example:
 
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 
 */

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dict = [Int: Int]() // [complement, index]
    for index in 0..<nums.count {
        let complement = target - nums[index]
        if let i = dict[nums[index]] {
            return [i, index]
        } else {
            dict[complement] = index
        }
    }
    return [0]
}
twoSum([2, 7, 11, 15], 9)
