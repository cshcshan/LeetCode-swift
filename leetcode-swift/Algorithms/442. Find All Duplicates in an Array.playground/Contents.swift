/*
 
 Given an array of integers, 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.
 
 Find all the elements that appear twice in this array.
 
 Could you do it without extra space and in O(n) runtime?
 
 # Example:
 Input: [4,3,2,7,8,2,3,1]
 Output: [2,3]
 
 */

class Solution {
    
    // *** 532 ms, faster than 20.93% ***
    // *** 23.9 MB, less than 100.00% ***
//    func findDuplicates(_ nums: [Int]) -> [Int] {
//        var result = [Int]()
//        var dict: [Int:Bool] = [:]
//        for num in nums {
//            if let _ = dict[num] {
//                dict[num] = true
//                result.append(num)
//            } else {
//                dict[num] = true
//            }
//        }
//        return result
//    }
    
    // *** 844 ms, faster than 5.81% ***
    // *** 24.1 MB, less than 100.00% ***
//    func findDuplicates(_ nums: [Int]) -> [Int] {
//        guard nums.count > 1 else { return [] }
//        var result = [Int]()
//        let numsorted = nums.sorted(by: <)
//        for index in 1..<numsorted.count {
//            if numsorted[index] == numsorted[index - 1] {
//                result.append(numsorted[index])
//            }
//        }
//        return result
//    }

    // *** 464 ms, faster than 70.93% ***
    // *** 23.8 MB, less than 100.00% ***
    func findDuplicates(_ nums: [Int]) -> [Int] {
        /*
         
         因為 1 ≤ num ≤ nums.count。
         例如：數量為8的 array，裡面每個 element 的值一定介於 1~8 (包含)之間
         
         */
        var result = [Int]()
        var _nums = nums
        for num in _nums {
            let absNum = abs(num)
            if _nums[absNum-1] < 0 {
                result.append(absNum)
            } else {
                _nums[absNum-1] = -_nums[absNum-1]
            }
        }
        return result
    }
}

Solution().findDuplicates([4,3,2,7,8,2,3,1]) // [2,3]
Solution().findDuplicates([1]) // []
Solution().findDuplicates([]) // []
