/*
 
 Given a non-empty array of integers, return the k most frequent elements.
 
 # Example 1:
 
 Input: nums = [1,1,1,2,2,3], k = 2
 Output: [1,2]
 
 # Example 2:
 
 Input: nums = [1], k = 1
 Output: [1]
 
 Note:
 
 You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
 Your algorithm's time complexity must be better than O(n log n), where n is the array's size.
 
 */

class Solution {
    // 104 ms, faster than 92.54%
    // 23.2 MB, less than 100.00%
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var result: [Int] = []
        var dictionary: [Int: Int] = [:]
        var array: [(Int, Int)] = []
        for num in nums {
            dictionary[num] = (dictionary[num] ?? 0) + 1
        }
        for (_, item) in dictionary.enumerated() {
            array.append((item.key, item.value))
        }
        array = array.sorted(by: { $0.1 > $1.1 })
        for index in 0..<k {
            result.append(array[index].0)
        }
        return result
    }
}

Solution().topKFrequent([1,1,1,2,2,3], 2) // [1,2]
