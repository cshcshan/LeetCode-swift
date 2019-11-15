/*
 
 Given a collection of distinct integers, return all possible permutations.
 
 # Example:
 
 Input: [1,2,3]
 Output:
 [
    [1,2,3],
    [1,3,2],
    [2,1,3],
    [2,3,1],
    [3,1,2],
    [3,2,1]
 ]
 
 */

class Solution {
    // !!!
    // 24 ms, faster than 63.91%
    // 20.8 MB, less than 16.67%
//    func permute(_ nums: [Int]) -> [[Int]] {
//        guard nums.count > 0 else { return [] }
//        guard nums.count > 1 else { return [nums] }
//        var result: [[Int]] = []
//        for index in 0..<nums.count {
//            var nums = nums
//            let num = nums[index]
//            nums.remove(at: index)
////            print("\n\n[num]: \([num]), nums: \(nums)")
//            result += dfs([num], nums)
//        }
//        return result
//    }
//
//    private func dfs(_ leftArray: [Int], _ rightArray: [Int]) -> [[Int]] {
//        if rightArray.count == 1 {
//            return [leftArray + rightArray]
//        }
//        var result: [[Int]] = []
//        for index in 0..<rightArray.count {
//            var tempLeft = leftArray
//            var tempRight = rightArray
//            let numRight = rightArray[index]
//
//            tempLeft.append(numRight)
//            tempRight.remove(at: index)
//
////            print("index: \(index), numRight: \(numRight), tempLeft: \(tempLeft), tempRight: \(tempRight)")
//
//            result += dfs(tempLeft, tempRight)
//        }
//        return result
//    }
    
    // !!!
    // 20 ms, faster than 91.44%
    // 20.9 MB, less than 16.67%
    func permute(_ nums: [Int]) -> [[Int]] {
        var arrays: [[Int]] = []
        dfs(&arrays, nums, 0)
        return arrays
    }
    
    private func dfs(_ arrays: inout [[Int]], _ arr: [Int], _ start: Int) {
        if start == arr.count {
//            print("\narr: \(arr)\n")
            arrays.append(arr)
        }
        var arr = arr
        for i in start..<arr.count {
            arr.swapAt(start, i)
//            print("A start: \(start), i: \(i), arr: \(arr)")
            dfs(&arrays, arr, start + 1)
            arr.swapAt(i, start)
//            print("B start: \(start), i: \(i), arr: \(arr)")
        }
    }
}

//Solution().permute([])
//Solution().permute([0])
//Solution().permute([0,1,2])
//Solution().permute([1,2,3])
//Solution().permute([0,1,2,3])
print(Solution().permute([0,1,2,3]))
