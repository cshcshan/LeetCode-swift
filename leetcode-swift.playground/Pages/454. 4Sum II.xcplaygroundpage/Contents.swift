/*
 
 Given four lists A, B, C, D of integer values, compute how many tuples (i, j, k, l) there are such that A[i] + B[j] + C[k] + D[l] is zero.
 
 To make problem a bit easier, all A, B, C, D have same length of N where 0 ≤ N ≤ 500. All integers are in the range of -228 to 228 - 1 and the result is guaranteed to be at most 231 - 1.
 
 # Example:
 
 Input:
 A = [ 1, 2]
 B = [-2,-1]
 C = [-1, 2]
 D = [ 0, 2]
 
 Output:
 2
 
 Explanation:
 
 The two tuples are:
 1. (0, 0, 0, 1) -> A[0] + B[0] + C[0] + D[1] = 1 + (-2) + (-1) + 2 = 0
 2. (1, 1, 0, 0) -> A[1] + B[1] + C[0] + D[0] = 2 + (-1) + (-1) + 0 = 0
 
 */

class Solution {
    // !!!
    // 260 ms, faster than 69.57%
    // 31.8 MB, less than 100.00%
//    func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
//        var result = 0
//        var dictionary: [Int: Int] = [:]
//        // 先求出 A, B 兩兩和並存入 dictionary 後，再求出 C, D 兩兩和相反數是否存在於 dictionary
//        for i in 0..<A.count {
//            for j in 0..<B.count {
//                let sum = A[i] + B[j]
//                dictionary[sum] = (dictionary[sum] ?? 0) + 1
//            }
//        }
//        for k in 0..<C.count {
//            for l in 0..<D.count {
//                let target = -1 * (C[k] + D[l])
//                if let count = dictionary[target] {
//                    result += count
//                }
//            }
//        }
//        return result
//    }
    
    // !!!
    // 368 ms, faster than 39.13%
    // 41.7 MB, less than 100.00%
    func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
        var result = 0
        var dictAB: [Int: Int] = [:]
        var dictCD: [Int: Int] = [:]
        let n = A.count
        for i in 0..<n {
            for j in 0..<n {
                let sumAB = A[i] + B[j]
                let sumCD = C[i] + D[j]
                dictAB[sumAB] = (dictAB[sumAB] ?? 0) + 1
                dictCD[sumCD] = (dictCD[sumCD] ?? 0) + 1
            }
        }
        for (_, item) in dictAB.enumerated() {
            if let count = dictCD[-1 * item.key] {
                result += item.value * count // !!!
            }
        }
        return result
    }
}

Solution().fourSumCount([ 1, 2], [-2,-1], [-1, 2], [ 0, 2]) // 2
Solution().fourSumCount([0,1,-1], [-1,1,0], [0,0,1], [-1,1,1]) // 17
