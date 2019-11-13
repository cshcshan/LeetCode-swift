/*
 
 Alice and Bob have candy bars of different sizes: A[i] is the size of the i-th bar of candy that Alice has, and B[j] is the size of the j-th bar of candy that Bob has.
 
 Since they are friends, they would like to exchange one candy bar each so that after the exchange, they both have the same total amount of candy.  (The total amount of candy a person has is the sum of the sizes of candy bars they have.)
 
 Return an integer array ans where ans[0] is the size of the candy bar that Alice must exchange, and ans[1] is the size of the candy bar that Bob must exchange.
 
 If there are multiple answers, you may return any one of them.  It is guaranteed an answer exists.
 
 # Example 1:
 
 Input: A = [1,1], B = [2,2]
 Output: [1,2]
 
 # Example 2:
 
 Input: A = [1,2], B = [2,3]
 Output: [1,2]
 
 # Example 3:
 
 Input: A = [2], B = [1,3]
 Output: [2,3]
 
 # Example 4:
 
 Input: A = [1,2,5], B = [2,4]
 Output: [5,4]
 
 Note:
 
 1 <= A.length <= 10000
 1 <= B.length <= 10000
 1 <= A[i] <= 100000
 1 <= B[i] <= 100000
 It is guaranteed that Alice and Bob have different total amounts of candy.
 It is guaranteed there exists an answer.
 
 */

class Solution {
    
    // *** 564 ms, faster than 58.82% ***
    // *** 21.4 MB, less than 100.00% ***
//    func fairCandySwap(_ A: [Int], _ B: [Int]) -> [Int] {
//        var sumA = 0
//        var sumB = 0
//        var dictA: [Int:Int] = [:]
//        for a in A { sumA += a }
//        for b in B { sumB += b }
//        let complement = (sumA - sumB) / 2
//        for a in A {
//            dictA[a - complement] = a
//        }
//        for b in B {
//            if let a = dictA[b] {
//                return [a, b]
//            }
//        }
//        return []
//    }

    // *** 520 ms, faster than 100.00% ***
    // *** 21.6 MB, less than 100.00% ***
    func fairCandySwap(_ A: [Int], _ B: [Int]) -> [Int] {
        var sumA = 0
        var sumB = 0
        var dict: [Int: Bool] = [:]
        if A.count > B.count {
            for index in 0..<A.count {
                sumA += A[index]
                dict[A[index]] = true
                if index < B.count {
                    sumB += B[index]
                }
            }
            let complement = (sumA - sumB) / 2
            for b in B {
                if let _ = dict[complement + b] {
                    return [complement + b, b]
                }
            }
        } else {
            for index in 0..<B.count {
                sumB += B[index]
                dict[B[index]] = true
                if index < A.count {
                    sumA += A[index]
                }
            }
            let complement = (sumA - sumB) / 2
            for a in A {
                if let _ = dict[a - complement] {
                    return [a, a - complement]
                }
            }
        }
        return []
    }
}

Solution().fairCandySwap([1,1], [2,2]) // [1,2]
Solution().fairCandySwap([1,2], [2,3]) // [1,2]
Solution().fairCandySwap([2], [1,3]) // [2,3]
Solution().fairCandySwap([1,2,5], [2,4]) // [5,4]
Solution().fairCandySwap([], []) // []
Solution().fairCandySwap([1], [1]) // [1]
Solution().fairCandySwap([2], []) // [1]
