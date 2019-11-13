/*
 
 Given an array of 2n integers, your task is to group these integers into n pairs of integer, say (a1, b1), (a2, b2), ..., (an, bn) which makes sum of min(ai, bi) for all i from 1 to n as large as possible.
 
 # Example 1:
 
 Input: [1,4,3,2]
 Output: 4
 Explanation: n is 2, and the maximum sum of pairs is 4 = min(1, 2) + min(3, 4).
 
 Note:
 n is a positive integer, which is in the range of [1, 10000].
 All the integers in the array will be in the range of [-10000, 10000].
 
 */

class Solution {
    
    // *** 632 ms, faster than 20.55% ***
    // *** 21.4 MB, less than 100.00% ***
//    func arrayPairSum(_ nums: [Int]) -> Int {
//        let numArray = nums.sorted(by: <)
//        var result = 0
//        for index in 0..<numArray.count/2 {
//            result += numArray[index * 2]
//        }
//        return result
//    }
    
    // *** 616 ms, faster than 28.77% ***
    // *** 21.5 MB, less than 100.00% ***
//    func arrayPairSum(_ nums: [Int]) -> Int {
//        let numArray = nums.sorted(by: <)
//        var result = 0
//        for index in stride(from: 0, to: numArray.count, by: 2) {
//            result += numArray[index]
//        }
//        return result
//    }

    // *** 608 ms, faster than 33.56% ***
    // *** 21 MB, less than 100.00% ***
    func arrayPairSum(_ nums: [Int]) -> Int {
        let numArray = nums.sorted(by: <)
        var result = 0
        for index in 0..<numArray.count where index % 2 == 0 {
            result += numArray[index]
        }
        return result
    }
}

Solution().arrayPairSum([1,4,3,2]) // 4 = min(1, 2) + min(3, 4)
