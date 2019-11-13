/*
 
 Given an array of integers, find if the array contains any duplicates.
 
 Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.
 
 # Example 1:
 
 Input: [1,2,3,1]
 Output: true
 
 # Example 2:
 
 Input: [1,2,3,4]
 Output: false
 
 # Example 3:
 
 Input: [1,1,1,3,3,4,3,2,4,2]
 Output: true
 
 */

class Solution {
    // 164 ms, faster than 31.63%
    // 22.4 MB, less than 20.00%
//    func containsDuplicate(_ nums: [Int]) -> Bool {
//        var dictionary: [Int:Bool] = [:]
//        for num in nums {
//            if let _ = dictionary[num] {
//                return true
//            } else {
//                dictionary[num] = true
//            }
//        }
//        return false
//    }
    
    // 152 ms, faster than 89.00%
    // 22.2 MB, less than 20.00%
//    func containsDuplicate(_ nums: [Int]) -> Bool {
//        guard nums.count > 1 else { return false }
//        var dictionary: [Int:Bool] = [:]
//        let mid = ((nums.count - 1) / 2) + 1
//        for index in 0..<mid {
//            var num = nums[index]
//            if let _ = dictionary[num] {
//                return true
//            } else {
//                dictionary[num] = true
//            }
//            let anotherIndex = (nums.count - 1) - index
//            if index != anotherIndex {
//                num = nums[anotherIndex]
//                if let _ = dictionary[num] {
//                    return true
//                } else {
//                    dictionary[num] = true
//                }
//            }
//        }
//        return false
//    }
    
    // 164 ms, faster than 31.63%
    // 21.8 MB, less than 20.00%
    func containsDuplicate(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else { return false }
        let sorted = nums.sorted(by: <)
        for index in 0..<sorted.count - 1 {
            if sorted[index] == sorted[index + 1] {
                return true
            }
        }
        return false
    }
}

Solution().containsDuplicate([]) // false
Solution().containsDuplicate([0]) // false
Solution().containsDuplicate([3,3]) // true
Solution().containsDuplicate([1,5,-2,-4,0]) // false
Solution().containsDuplicate([1,2,3,4,3]) // true
Solution().containsDuplicate([1,2,3,1]) // true
Solution().containsDuplicate([1,2,3,4]) // false
Solution().containsDuplicate([1,1,1,3,3,4,3,2,4,2]) // true
