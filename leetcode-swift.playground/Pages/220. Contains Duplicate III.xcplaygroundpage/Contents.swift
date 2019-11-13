/*
 
 Given an array of integers, find out whether there are two distinct indices i and j in the array such that the absolute difference between nums[i] and nums[j] is at most t and the absolute difference between i and j is at most k.
 
 # Example 1:
 
 Input: nums = [1,2,3,1], k = 3, t = 0
 Output: true
 
 # Example 2:
 
 Input: nums = [1,0,1,1], k = 1, t = 2
 Output: true
 
 # Example 3:
 
 Input: nums = [1,5,9,1,5,9], k = 2, t = 3
 Output: false
 
 (219. Contains Duplicate II)
 */

class Solution {
    // !!!
    // 40 ms, faster than 100.00%
    // 21.4 MB, less than 100.00%
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        guard nums.count > 0 && k > 0 && t >= 0 else { return false }
        var dictionary: [Int:Int] = [:]
        let dividend = t + 1 // 避免 t = 0 作為分母會有問題，所以無條件 +1
        for index in 0..<nums.count {
            let num = nums[index]
            var bucket = num / dividend
            if num < 0 {
                bucket -= 1
            }
            /*
             因為會移除掉過舊的 index (index - k >= 0) 資料
             所以還在 dictionary 的資料都是範圍內資料 (index 都在 k 範圍內)
             所以可以大膽尋找目前桶子或上一個/下一個桶子內的資料做比對
             */
            if let _ = dictionary[bucket] {
                return true
            } else if let oldNum = dictionary[bucket + 1], oldNum - num <= t {
                // 尋找下一個桶子
                return true
            } else if let oldNum = dictionary[bucket - 1], num - oldNum <= t {
                // 尋找上一個桶子
                return true
            }
            if index >= k {
                // 移除掉過舊的 index (index - k >= 0) 資料
                let oldBucket = nums[index - k] / dividend
                dictionary.removeValue(forKey: oldBucket)
            }
            dictionary[bucket] = num
        }
        return false
    }
}

/*
 abs(nums[i]-nums[j]) <= t
 abs(i-j) <= k
 */
Solution().containsNearbyAlmostDuplicate([2,1], 2, 1) // true
Solution().containsNearbyAlmostDuplicate([4,2], 2, 1) // false
Solution().containsNearbyAlmostDuplicate([2,2], 3, 0) // true
Solution().containsNearbyAlmostDuplicate([1,2,3,1], 3, 0) // true
Solution().containsNearbyAlmostDuplicate([1,0,1,1], 1, 2) // true
Solution().containsNearbyAlmostDuplicate([1,5,9,1,5,9], 2, 3) // false

