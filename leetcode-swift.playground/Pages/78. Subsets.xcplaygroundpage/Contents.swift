/*
 
 Given a set of distinct integers, nums, return all possible subsets (the power set).
 
 Note: The solution set must not contain duplicate subsets.
 
 # Example:
 
 Input: nums = [1,2,3]
 Output:
 [
    [3],
    [1],
    [2],
    [1,2,3],
    [1,3],
    [2,3],
    [1,2],
    []
 ]
 
 */

class Solution {
    // !!!
    // 12 ms, faster than 70.30%
    // 21 MB, less than 20.00%
//    func subsets(_ nums: [Int]) -> [[Int]] {
//        var result: [[Int]] = []
//
//        for i in 0..<nums.count {
//            let num = nums[i]
//
//            print("\n\n == i: \(i) == ")
//            print("num: \(num)")
//            print("result: \(result)")
//
//            for j in 0..<result.count {
//
//                print("\n == j: \(j) == ")
//
//                var temp = result[j]
//                temp.append(num)
//                print("temp: \(temp)")
//
//                result.append(temp)
//                print("result: \(result)")
//            }
//            result.append([nums[i]])
//        }
//
//        result.append([])
//
//        return result
//    }
    
    // !!!
    // 8 ms, faster than 97.37%
    // 20.9 MB, less than 20.00%
    func subsets(_ nums: [Int]) -> [[Int]] {
        var arrays: [[Int]] = []
        dfs(nums, &arrays, [], 0)
        return arrays
    }
    
    private func dfs(_ nums: [Int], _ arrays: inout [[Int]], _ arr: [Int], _ start: Int) {
        var arr = arr
        arrays.append(arr)
        for i in start..<nums.count {
            arr.append(nums[i]) // 要
            dfs(nums, &arrays, arr, i + 1)
            arr.removeLast() // 不要
        }
    }
}

Solution().subsets([])
Solution().subsets([1])
Solution().subsets([1,2])
Solution().subsets([1,2,3])
Solution().subsets([1,2,3,4])
Solution().subsets([1,2,3,4,5])

/*
 [
    [3],
    [1],
    [2],
    [1,2,3],
    [1,3],
    [2,3],
    [1,2],
    []
 ]
 */
