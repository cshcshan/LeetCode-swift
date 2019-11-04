/*
 
 Given an array of integers where 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.
 
 Find all the elements of [1, n] inclusive that do not appear in this array.
 
 Could you do it without extra space and in O(n) runtime? You may assume the returned list does not count as extra space.
 
 # Example:
 
 Input:
 [4,3,2,7,8,2,3,1]
 
 Output:
 [5,6]
 
 (41. First Missing Positive)
 */

class Solution {
    // 872 ms, faster than 5.13%
    // 24.2 MB, less than 33.33%
//    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
//        guard nums.count > 0 else { return [] }
//        var result: [Int] = []
//        var sorted = nums.sorted(by: >) // descending
//        for index in 1...nums.count {
//            var exists = false
//            while sorted.count > 0 && sorted[sorted.count-1] == index {
//                sorted.remove(at: sorted.count-1)
//                exists = true
//            }
//            if exists == false {
//                result.append(index)
//            }
//        }
//        return result
//    }
    
    // 464 ms, faster than 78.63%
    // 23.4 MB, less than 33.33%
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        guard nums.count > 0 else { return [] }
        // 1. 建立數量為 nums.count 的 array，並預設都放 0
        var array: [Int] = [Int](repeating: 0, count: nums.count)
        // 2. 迴圈尋找 nums，並在 array 註記該數字已出現 (-1)
        for num in nums {
            array[num - 1] = -1
        }
        var result: [Int] = []
        // 3. 迴圈尋找 array 為 0 的數字即消失的數字
        for index in 0..<array.count {
            if array[index] == 0 {
                result.append(index+1)
            }
        }
        return result
    }
}

Solution().findDisappearedNumbers([])
Solution().findDisappearedNumbers([1,1]) // [2]
Solution().findDisappearedNumbers([4,3,2,7,2,2,3]) // [1,5,6]
Solution().findDisappearedNumbers([4,3,2,7,8,2,3,1]) // [5,6]
