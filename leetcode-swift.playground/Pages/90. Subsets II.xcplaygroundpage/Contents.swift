/*
 
 Given a collection of integers that might contain duplicates, nums, return all possible subsets (the power set).
 
 Note: The solution set must not contain duplicate subsets.
 
 # Example:
 
 Input: [1,2,2]
 Output:
 [
    [2],
    [1],
    [1,2,2],
    [2,2],
    [1,2],
    []
 ]
 
 */

class Solution {
    // !!!
    // 88 ms, faster than 8.64%
    // 21.3 MB, less than 33.33%
//    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
//        var result: [[Int]] = []
//        var nums = nums.sorted(by: <)
//
//        for i in 0..<nums.count {
//            let num = nums[i]
//            for j in 0..<result.count {
//                var temp = result[j]
//                temp.append(num)
//                if !result.contains(temp) {
//                    result.append(temp)
//                }
//            }
//            if !result.contains([num]) {
//                result.append([num])
//            }
//        }
//
//        result.append([])
//
//        return result
//    }
    
    // 16 ms, faster than 79.01%
    // 21.4 MB, less than 33.33%
//    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
//        guard nums.count > 0 else { return [] }
//
//        var result: [[Int]] = []
//        var nums = nums.sorted(by: <)
//        var lastAppendCount = 0
//
//        for i in 0..<nums.count {
//            let num = nums[i]
//            var count = lastAppendCount
//            lastAppendCount = 0
//            var isDuplicated = false
//            if i > 0 {
//                if num == nums[i - 1] {
//                    isDuplicated = true
//                }
//            }
//            if !isDuplicated {
//                count = result.count
//            }
//
//            for j in result.count - count..<result.count {
//                var temp = result[j]
//                temp.append(num)
//                result.append(temp)
//                lastAppendCount += 1
//            }
//
//            if !isDuplicated {
//                result.append([num])
//                lastAppendCount += 1
//            }
//        }
//
//        result.append([])
//
//        return result
//    }
    
    // !!!
    // 16 ms, faster than 79.01%
    // 21.4 MB, less than 33.33%
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var arrays: [[Int]] = []
        var nums = nums.sorted(by: <)
        dfs(nums, &arrays, [], 0)
        return arrays
    }
    
    private func dfs(_ nums: [Int], _ arrays: inout [[Int]], _ arr: [Int], _ start: Int) {
        var arr = arr
        arrays.append(arr)
        for i in start..<nums.count {
            if start == i || nums[i] != nums[i - 1] {
                arr.append(nums[i]) // 要
                dfs(nums, &arrays, arr, i + 1)
                if arr.count > 0 {
                    arr.removeLast() // 不要
                }
            }
        }
    }
}

Solution().subsetsWithDup([4,4,4,1,4])
Solution().subsetsWithDup([1,1])
Solution().subsetsWithDup([1,2])
Solution().subsetsWithDup([1,2,2])
Solution().subsetsWithDup([1,2,2,2])
Solution().subsetsWithDup([1,2,2,2,3])
