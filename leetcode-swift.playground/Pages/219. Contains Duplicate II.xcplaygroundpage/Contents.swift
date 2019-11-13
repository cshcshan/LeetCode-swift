/*
 
 Given an array of integers and an integer k, find out whether there are two distinct indices i and j in the array such that nums[i] = nums[j] and the absolute difference between i and j is at most k.
 (It means that abs(i-j) <= k)
 
 # Example 1:
 
 Input: nums = [1,2,3,1], k = 3
 Output: true
 
 # Example 2:
 
 Input: nums = [1,0,1,1], k = 1
 Output: true
 
 # Example 3:
 
 Input: nums = [1,2,3,1,2,3], k = 2
 Output: false
 
 */

class Solution {
    // 108 ms, faster than 75.70%
    // 23.5 MB, less than 100.00%
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        guard nums.count > 1 && k > 0 else { return false }
        var dictionary: [Int:Int] = [:]
        // k 可能會大於 nums.count，所以範圍不可以設定為 0..<nums.count-k
        for index in 0..<nums.count {
            let num = nums[index]
            if let oldIndex = dictionary[num] {
                if index - oldIndex <= k {
                    return true
                }
                dictionary[num] = index
            } else {
                dictionary[num] = index
            }
        }
        return false
    }
}

Solution().containsNearbyDuplicate([1,2,3,1], 3) // true
Solution().containsNearbyDuplicate([1,0,1,1], 1) // true
Solution().containsNearbyDuplicate([1,2,3,1,2,3], 2) // false
Solution().containsNearbyDuplicate([99,99], 2) // true
Solution().containsNearbyDuplicate([1,2,1], 0) // false
