/*
 
 Given a set of candidate numbers (candidates) (without duplicates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.
 
 The same repeated number may be chosen from candidates unlimited number of times.
 
 Note:
 
 All numbers (including target) will be positive integers.
 The solution set must not contain duplicate combinations.
 
 # Example 1:
 
 Input: candidates = [2,3,6,7], target = 7,
 A solution set is:
 [
    [7],
    [2,2,3]
 ]
 
 # Example 2:
 
 Input: candidates = [2,3,5], target = 8,
 A solution set is:
 [
    [2,2,2,2],
    [2,3,3],
    [3,5]
 ]
 
 */

class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let num_Array = candidates.sorted { (int1, int2) -> Bool in
            return int1 < int2
        }
        
        var result = [[Int]]()
        recursive(0, num_Array: num_Array, target: target, subresult: [Int](), result: &result)
        
        return result
    }
    
    func recursive(_ index: Int, num_Array: [Int]!, target: Int, subresult: [Int], result: inout [[Int]]) {
        if target == 0 {
            result.append(subresult)
            return
        }
        for i in index..<num_Array.count {
            let complement = target - num_Array[i]
            if complement >= 0 {
                var _subresult = subresult
                _subresult.append(num_Array[i])
                recursive(i, num_Array: num_Array, target: complement, subresult: _subresult, result: &result)
            } else {
                break
            }
        }
    }
}
Solution().combinationSum([2, 3, 6, 7], 7)
