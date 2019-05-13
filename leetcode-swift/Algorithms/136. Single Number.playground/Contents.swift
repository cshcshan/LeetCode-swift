/*
 
 Given a non-empty array of integers, every element appears twice except for one. Find that single one.
 
 Note:
 
 Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 
 # Example 1:
 
 Input: [2,2,1]
 Output: 1
 
 # Example 2:
 
 Input: [4,1,2,1,2]
 Output: 4
 
 */

import Foundation

class Solution {
    // *** 92 ms / 22.3 MB ***
//    func singleNumber(_ nums: [Int]) -> Int {
//        var numDict: [Int: Bool] = [:]
//        for num in nums {
//            let single = numDict[num]
//            if single == nil {
//                numDict[num] = true
//            } else if single == true {
//                numDict.removeValue(forKey: num)
//            }
//        }
//        return numDict.filter({ $0.value == true }).keys.first ?? 0
//    }
    
    // *** 80 ms / 20.9 MB ***
//    func singleNumber(_ nums: [Int]) -> Int {
//        return nums.reduce(0, { $0 ^ $1 })
//    }
    
    // *** 76 ms / 20.7 MB ***
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        for num in nums {
            result ^= num
        }
        return result
    }
}
Solution().singleNumber([2, 2, 1])
Solution().singleNumber([4,1,2,1,2])
