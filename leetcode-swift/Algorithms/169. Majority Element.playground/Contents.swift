/*

 Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.
 
 You may assume that the array is non-empty and the majority element always exist in the array.
 
 # Example 1:
 
 Input: [3,2,3]
 Output: 3
 
 # Example 2:
 
 Input: [2,2,1,1,1,2,2]
 Output: 2
 
 */

class Solution {
    // 156 ms, faster than 55.00%
    // 23.1 MB, less than 33.33%
//    func majorityElement(_ nums: [Int]) -> Int {
//        let mid: Float = Float(nums.count) / Float(2)
//        var dictionary: [Int:Int] = [:]
//        for num in nums {
//            if let count = dictionary[num] {
//                dictionary[num] = count + 1
//            } else {
//                dictionary[num] = 1
//            }
//        }
//        for (_, item) in dictionary.enumerated() {
//            if Float(item.value) > mid {
//                return item.key
//            }
//        }
//        return 0
//    }
    
    // 148 ms, faster than 72.94%
    // 21.9 MB, less than 33.33%
    func majorityElement(_ nums: [Int]) -> Int {
        let mid: Float = Float(nums.count) / Float(2)
        var dictionary: [Int:Int] = [:]
        for num in nums {
            if let count = dictionary[num] {
                if Float(count + 1) > mid {
                    return num
                }
                dictionary[num] = count + 1
            } else {
                if Float(1) > mid {
                    return num
                }
                dictionary[num] = 1
            }
        }
        return 0
    }
}

Solution().majorityElement([3,2,3]) // 3
Solution().majorityElement([2,2,1,1,1,2,2]) // 2
Solution().majorityElement([1]) // 1
